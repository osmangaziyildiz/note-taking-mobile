import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_create_state.freezed.dart';

@freezed
abstract class NoteCreateState with _$NoteCreateState {
  const factory NoteCreateState({
    @Default('') String title,
    @Default('') String content,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isSuccess,
    NoteCreateSingleTimeEvent? singleTimeEvent,
  }) = _NoteCreateState;
}

@freezed
abstract class NoteCreateSingleTimeEvent with _$NoteCreateSingleTimeEvent {
  const factory NoteCreateSingleTimeEvent.showErrorDialog(String message) = _ShowErrorDialog;
  const factory NoteCreateSingleTimeEvent.showSuccessDialog(String message) = _ShowSuccessDialog;
  const factory NoteCreateSingleTimeEvent.navigateToHome() = _NavigateToHome;
}
