import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
import 'package:notetakingapp/features/home/bloc/home_bloc.dart';
import 'package:notetakingapp/features/home/bloc/home_event.dart';
import 'package:notetakingapp/features/note/bloc/edit/note_edit_event.dart';
import 'package:notetakingapp/features/note/bloc/edit/note_edit_state.dart';

class NoteEditBloc extends Bloc<NoteEditEvent, NoteEditState> {

  NoteEditBloc({
    required NoteRepository noteRepository,
  })  : _noteRepository = noteRepository,
        super(const NoteEditState()) {
    on<NoteEditEvent>(_onNoteEditEvent);
  }
  final NoteRepository _noteRepository;

  Future<void> _onNoteEditEvent(
    NoteEditEvent event,
    Emitter<NoteEditState> emit,
  ) async {
    await event.when(
      loadNote: (noteId) async => _onLoadNote(noteId, emit),
      titleChanged: (title) async => _onTitleChanged(title, emit),
      contentChanged: (content) async => _onContentChanged(content, emit),
      submitPressed: () async => _onSubmitPressed(emit),
      deletePressed: () async => _onDeletePressed(emit),
      confirmDelete: () async => _onConfirmDelete(emit),
      clearSingleTimeEvent: () async => _onClearSingleTimeEvent(emit),
    );
  }

  Future<void> _onLoadNote(String noteId, Emitter<NoteEditState> emit) async {
    print('🔄 Loading note with ID: $noteId');
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _noteRepository.getNoteById(noteId);
    result.fold(
      (error) {
        print('❌ Error loading note: $error');
        emit(state.copyWith(
          isLoading: false,
          error: error,
          singleTimeEvent: NoteEditSingleTimeEvent.showErrorDialog(error),
        ));
      },
      (note) {
        print('✅ Note loaded successfully: ${note.title}');
        emit(state.copyWith(
          isLoading: false,
          note: note,
          title: note.title,
          content: note.content,
          error: null,
        ));
      },
    );
  }

  void _onTitleChanged(String title, Emitter<NoteEditState> emit) {
    emit(state.copyWith(title: title, error: null));
  }

  void _onContentChanged(String content, Emitter<NoteEditState> emit) {
    emit(state.copyWith(content: content, error: null));
  }

  Future<void> _onSubmitPressed(Emitter<NoteEditState> emit) async {
    if (state.note == null) return;

    // Validate form
    if (state.title.trim().isEmpty) {
      emit(state.copyWith(
        singleTimeEvent: const NoteEditSingleTimeEvent.showErrorDialog(
          'Please enter a title for your note',
        ),
      ));
      return;
    }

    if (state.content.trim().isEmpty) {
      emit(state.copyWith(
        singleTimeEvent: const NoteEditSingleTimeEvent.showErrorDialog(
          'Please enter content for your note',
        ),
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _noteRepository.updateNote(
      noteId: state.note!.id,
      title: state.title.trim(),
      content: state.content.trim(),
    );

    result.fold(
      (error) => emit(state.copyWith(
        isLoading: false,
        error: error,
        singleTimeEvent: NoteEditSingleTimeEvent.showErrorDialog(error),
      )),
      (updatedNote) => emit(state.copyWith(
        isLoading: false,
        note: updatedNote,
        isSuccess: true,
        singleTimeEvent: const NoteEditSingleTimeEvent.navigateToHome(),
      )),
    );
  }

  Future<void> _onDeletePressed(Emitter<NoteEditState> emit) async {
    if (state.note == null) return;

    emit(state.copyWith(
      singleTimeEvent: const NoteEditSingleTimeEvent.showDeleteConfirmation(),
    ));
  }

  Future<void> _onConfirmDelete(Emitter<NoteEditState> emit) async {
    print('🗑️ Confirm delete called, note: ${state.note?.title ?? 'NULL'}');
    if (state.note == null) {
      print('❌ Note is null, showing error dialog');
      emit(state.copyWith(
        singleTimeEvent: const NoteEditSingleTimeEvent.showErrorDialog(
          'Note not found. Please try again.',
        ),
      ));
      return;
    }

    print('🔄 Starting delete process for note: ${state.note!.title}');
    emit(state.copyWith(isDeleting: true, error: null));

    final result = await _noteRepository.deleteNote(state.note!.id);

    result.fold(
      (error) {
        print('❌ Delete failed: $error');
        emit(state.copyWith(
          isDeleting: false,
          error: error,
          singleTimeEvent: NoteEditSingleTimeEvent.showErrorDialog(error),
        ));
      },
      (success) {
        print('✅ Delete successful');
        
        // Notify HomeBloc to remove the note from its state
        final homeBloc = sl.get<HomeBloc>();
        homeBloc.add(HomeEvent.removeNote(state.note!.id));
        
        emit(state.copyWith(
          isDeleting: false,
          isSuccess: true,
          singleTimeEvent: const NoteEditSingleTimeEvent.navigateToHome(),
        ));
      },
    );
  }

  void _onClearSingleTimeEvent(Emitter<NoteEditState> emit) {
    emit(state.copyWith(singleTimeEvent: null));
  }

  void clearSingleTimeEvent() {
    add(const NoteEditEvent.clearSingleTimeEvent());
  }
}
