import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
import 'package:notetakingapp/features/home/bloc/home_bloc.dart';
import 'package:notetakingapp/features/home/bloc/home_event.dart';
import 'package:notetakingapp/features/note/bloc/create/note_create_event.dart';
import 'package:notetakingapp/features/note/bloc/create/note_create_state.dart';

class NoteCreateBloc extends Bloc<NoteCreateEvent, NoteCreateState> {

  NoteCreateBloc({
    required NoteRepository noteRepository,
  })  : _noteRepository = noteRepository,
        super(const NoteCreateState()) {
    on<NoteCreateEvent>(_onNoteCreateEvent);
  }
  final NoteRepository _noteRepository;

  Future<void> _onNoteCreateEvent(
    NoteCreateEvent event,
    Emitter<NoteCreateState> emit,
  ) async {
    await event.when(
      titleChanged: (title) async => _onTitleChanged(title, emit),
      contentChanged: (content) async => _onContentChanged(content, emit),
      submitPressed: () async => _onSubmitPressed(emit),
      clearForm: () async => _onClearForm(emit),
      clearSingleTimeEvent: () async => _onClearSingleTimeEvent(emit),
    );
  }

  void _onTitleChanged(String title, Emitter<NoteCreateState> emit) {
    emit(state.copyWith(title: title, error: null));
  }

  void _onContentChanged(String content, Emitter<NoteCreateState> emit) {
    emit(state.copyWith(content: content, error: null));
  }


  Future<void> _onSubmitPressed(Emitter<NoteCreateState> emit) async {
    // Validate form
    if (state.title.trim().isEmpty) {
      emit(state.copyWith(
        singleTimeEvent: const NoteCreateSingleTimeEvent.showErrorDialog(
          'Please enter a title for your note',
        ),
      ));
      return;
    }

    if (state.content.trim().isEmpty) {
      emit(state.copyWith(
        singleTimeEvent: const NoteCreateSingleTimeEvent.showErrorDialog(
          'Please enter content for your note',
        ),
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _noteRepository.createNote(
      title: state.title.trim(),
      content: state.content.trim(),
    );

    result.fold(
      (error) => emit(state.copyWith(
        isLoading: false,
        error: error,
        singleTimeEvent: NoteCreateSingleTimeEvent.showErrorDialog(error),
      )),
      (note) {
        
        // Notify HomeBloc to add the new note to its state
        sl.get<HomeBloc>()
        .add(HomeEvent.addNote(note));
        
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          singleTimeEvent: const NoteCreateSingleTimeEvent.showSuccessDialog(
            'Note created successfully!',
          ),
        ));
      },
    );
  }

  void _onClearForm(Emitter<NoteCreateState> emit) {
    emit(const NoteCreateState());
  }

  void _onClearSingleTimeEvent(Emitter<NoteCreateState> emit) {
    emit(state.copyWith(singleTimeEvent: null));
  }

  void clearSingleTimeEvent() {
    add(const NoteCreateEvent.clearSingleTimeEvent());
  }
}
