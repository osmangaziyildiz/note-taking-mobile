import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_edit_event.freezed.dart';

@freezed
abstract class NoteEditEvent with _$NoteEditEvent {
  const factory NoteEditEvent.loadNote(String noteId) = _LoadNote;
  const factory NoteEditEvent.titleChanged(String title) = _TitleChanged;
  const factory NoteEditEvent.contentChanged(String content) = _ContentChanged;
  const factory NoteEditEvent.submitPressed() = _SubmitPressed;
  const factory NoteEditEvent.deletePressed() = _DeletePressed;
  const factory NoteEditEvent.confirmDelete() = _ConfirmDelete;
  const factory NoteEditEvent.clearSingleTimeEvent() = _ClearSingleTimeEvent;
}
