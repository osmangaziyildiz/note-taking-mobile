import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/connection_service.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
import 'package:notetakingapp/features/home/bloc/home_event.dart';
import 'package:notetakingapp/features/home/bloc/home_state.dart';
import 'package:notetakingapp/features/home/widgets/home_note_filters.dart';

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
      toggleFavorite: (noteId) async => _onToggleFavorite(noteId, emit),
      changeFilter: (filter) async => _onChangeFilter(filter, emit),
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
    final updatedNotes = state.notes.where((note) => note.id != noteId).toList();
    emit(state.copyWith(notes: updatedNotes));
  }

  void _onAddNote(NoteModel note, Emitter<HomeState> emit) {
    final updatedNotes = [note, ...state.notes]; // Add to beginning of list
    emit(state.copyWith(notes: updatedNotes));
  }

  Future<void> _onToggleFavorite(String noteId, Emitter<HomeState> emit) async {
    final result = await _noteRepository.toggleNoteFavorite(noteId);
    
    result.fold(
      (error) => emit(state.copyWith(error: error)),
      (updatedNote) {
        // Update the note in the list
        final updatedNotes = state.notes.map((note) {
          return note.id == noteId ? updatedNote : note;
        }).toList();
        emit(state.copyWith(notes: updatedNotes, error: null));
      },
    );
  }

  void _onChangeFilter(NoteFilter filter, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedFilter: filter));
  }

  @override
  Future<void> close() {
    _connSub.cancel();
    return super.close();
  }
}
