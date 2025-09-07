import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_create_event.freezed.dart';

@freezed
abstract class NoteCreateEvent with _$NoteCreateEvent {
  const factory NoteCreateEvent.titleChanged(String title) = _TitleChanged;
  const factory NoteCreateEvent.contentChanged(String content) = _ContentChanged;
  const factory NoteCreateEvent.submitPressed() = _SubmitPressed;
  const factory NoteCreateEvent.clearForm() = _ClearForm;
  const factory NoteCreateEvent.clearSingleTimeEvent() = _ClearSingleTimeEvent;
}
