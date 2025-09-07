import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/connection_service.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
import 'package:notetakingapp/features/home/bloc/home_event.dart';
import 'package:notetakingapp/features/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc({
    required NoteRepository noteRepository,
    required ConnectionService connectionService,
  })  : _noteRepository = noteRepository,
        _connectionService = connectionService,
        super(const HomeState()) {
    on<HomeEvent>(_onHomeEvent);
    _connSub = _connectionService.connectionStream.listen((isOnline) {
      if (isOnline) add(const HomeEvent.loadNotes());
    });
  }
  
  final NoteRepository _noteRepository;
  final ConnectionService _connectionService;
  late final StreamSubscription<bool> _connSub;

  Future<void> _onHomeEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await event.when(
      loadNotes: () async => _onLoadNotes(emit),
      removeNote: (noteId) async => _onRemoveNote(noteId, emit),
      addNote: (note) async => _onAddNote(note, emit),
    );
  }

  Future<void> _onLoadNotes(Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _noteRepository.getAllNotes();

    result.fold(
      (error) => emit(state.copyWith(
        isLoading: false,
        error: error,
      )),
      (notes) => emit(state.copyWith(
        isLoading: false,
        notes: notes,
        error: null,
      )),
    );
  }

  void _onRemoveNote(String noteId, Emitter<HomeState> emit) {
    print('🗑️ Removing note from home state: $noteId');
    final updatedNotes = state.notes.where((note) => note.id != noteId).toList();
    emit(state.copyWith(notes: updatedNotes));
    print('✅ Note removed from home state. Remaining notes: ${updatedNotes.length}');
  }

  void _onAddNote(NoteModel note, Emitter<HomeState> emit) {
    print('➕ Adding note to home state: ${note.title}');
    final updatedNotes = [note, ...state.notes]; // Add to beginning of list
    emit(state.copyWith(notes: updatedNotes));
    print('✅ Note added to home state. Total notes: ${updatedNotes.length}');
  }

  @override
  Future<void> close() {
    _connSub.cancel();
    return super.close();
  }
}
