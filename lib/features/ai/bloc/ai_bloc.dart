import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/repositories/local_note_repository.dart';
import 'package:notetakingapp/core/services/gemini_service.dart';
import 'package:notetakingapp/features/ai/bloc/ai_event.dart';
import 'package:notetakingapp/features/ai/bloc/ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  AiBloc({
    required GeminiService geminiService,
    required LocalNoteRepository localNoteRepository,
  })  : _geminiService = geminiService,
        _localNoteRepository = localNoteRepository,
        super(const AiState.initial()) {
    on<AiEvent>(_onAiEvent);
  }

  final GeminiService _geminiService;
  final LocalNoteRepository _localNoteRepository;
  
  // Chat history
  final List<Map<String, String>> _chatHistory = [];
  String? _notesText;

  Future<void> _onAiEvent(
    AiEvent event,
    Emitter<AiState> emit,
  ) async {
    await event.when(
      askQuestion: (question) async => _onAskQuestion(question, emit),
      clearResponse: () async => _onClearResponse(emit),
    );
  }

  Future<void> _onAskQuestion(
    String question,
    Emitter<AiState> emit,
  ) async {
    emit(const AiState.loading());

    try {
      // 1. If first question, get notes, otherwise use existing notes
      if (_notesText == null) {
        final notesResult = await _localNoteRepository.getAllNotes();
        
        await notesResult.fold(
          (error) async => emit(AiState.error(message: 'Error loading notes: $error')),
          (notes) async {
            _notesText = _formatNotesForAI(notes);
            await _processQuestion(question, emit);
          },
        );
      } else {
        await _processQuestion(question, emit);
      }
    } on Exception catch (e) {
      emit(AiState.error(message: 'Unexpected error: $e'));
    }
  }

  Future<void> _processQuestion(String question, Emitter<AiState> emit) async {
    // 2. Send to AI (with chat history)
    final aiResult = await _geminiService.askQuestionWithNotes(
      question: question,
      notes: _notesText!,
      chatHistory: _chatHistory.isNotEmpty ? _chatHistory : null,
    );
    
    await aiResult.fold(
      (error) async => emit(AiState.error(message: 'Error getting AI response: $error')),
      (response) async {
        
        // Add to chat history
        _chatHistory..add({'role': 'user', 'content': question})
        ..add({'role': 'model', 'content': response});
        
        emit(AiState.responseReceived(
          response: response,
          chatHistory: _chatHistory,
        ));
      },
    );
  }

  Future<void> _onClearResponse(Emitter<AiState> emit) async {
    _chatHistory.clear();
    _notesText = null;
    emit(const AiState.initial());
  }

  String _formatNotesForAI(List<NoteModel> notes) {
    if (notes.isEmpty) {
      return 'Kullanıcının henüz notu bulunmuyor.';
    }

    final buffer = StringBuffer()
    ..writeln('Kullanıcının notları:')
    ..writeln('==================');
    
    for (var i = 0; i < notes.length; i++) {
      final note = notes[i];
      buffer..writeln('${i + 1}. ${note.title}')
      ..writeln('   ${note.content}')
      ..writeln('   Tarih: ${note.createdAt}');
      if (note.tags.isNotEmpty) {
        buffer.writeln('   Etiketler: ${note.tags.join(', ')}');
      }
      buffer.writeln();
    }
    
    return buffer.toString();
  }
}
