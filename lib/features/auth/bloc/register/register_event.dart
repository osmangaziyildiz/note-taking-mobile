import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.nameChanged(String name) = _NameChanged;
  const factory RegisterEvent.emailChanged(String email) = _EmailChanged;
  const factory RegisterEvent.passwordChanged(String password) = _PasswordChanged;
  const factory RegisterEvent.confirmPasswordChanged(String confirmPassword) = _ConfirmPasswordChanged;
  const factory RegisterEvent.submitPressed() = _SubmitPressed;
  const factory RegisterEvent.signInWithGooglePressed() = _SignInWithGooglePressed;
  const factory RegisterEvent.sendEmailVerification() = _SendEmailVerification;
  const factory RegisterEvent.checkEmailVerification() = _CheckEmailVerification;
  const factory RegisterEvent.clearForm() = _ClearForm;
  const factory RegisterEvent.clearSingleTimeEvent() = _ClearSingleTimeEvent;
}
