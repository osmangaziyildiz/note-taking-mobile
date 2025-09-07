import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notetakingapp/core/models/note_model.dart';

part 'note_edit_state.freezed.dart';

@freezed
abstract class NoteEditState with _$NoteEditState {
  const factory NoteEditState({
    NoteModel? note,
    @Default('') String title,
    @Default('') String content,
    @Default(false) bool isLoading,
    @Default(false) bool isDeleting,
    String? error,
    @Default(false) bool isSuccess,
    NoteEditSingleTimeEvent? singleTimeEvent,
  }) = _NoteEditState;
}

@freezed
abstract class NoteEditSingleTimeEvent with _$NoteEditSingleTimeEvent {
  const factory NoteEditSingleTimeEvent.showErrorDialog(String message) = _ShowErrorDialog;
  const factory NoteEditSingleTimeEvent.showSuccessDialog(String message) = _ShowSuccessDialog;
  const factory NoteEditSingleTimeEvent.navigateToHome() = _NavigateToHome;
  const factory NoteEditSingleTimeEvent.showDeleteConfirmation() = _ShowDeleteConfirmation;
}
