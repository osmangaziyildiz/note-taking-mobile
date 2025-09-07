import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/features/home/widgets/home_note_filters.dart';

part 'home_event.freezed.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadNotes() = _LoadNotes;
  const factory HomeEvent.removeNote(String noteId) = _RemoveNote;
  const factory HomeEvent.addNote(NoteModel note) = _AddNote;
  const factory HomeEvent.toggleFavorite(String noteId) = _ToggleFavorite;
  const factory HomeEvent.changeFilter(NoteFilter filter) = _ChangeFilter;
}
