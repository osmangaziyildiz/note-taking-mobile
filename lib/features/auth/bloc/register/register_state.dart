import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(true) bool isNameValid,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isConfirmPasswordValid,
    @Default(false) bool isFormValid,
    @Default(false) bool isLoading,
    @Default(false) bool isEmailVerificationSent,
    @Default(false) bool isEmailVerified,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    RegisterSingleTimeEvent? singleTimeEvent,
  }) = _RegisterState;
}

@freezed
abstract class RegisterSingleTimeEvent with _$RegisterSingleTimeEvent {
  const factory RegisterSingleTimeEvent.showErrorDialog(String message) = _ShowErrorDialog;
  const factory RegisterSingleTimeEvent.showSuccessDialog(String message) = _ShowSuccessDialog;
  const factory RegisterSingleTimeEvent.navigateToHome() = _NavigateToHome;
  const factory RegisterSingleTimeEvent.navigateToLogin() = _NavigateToLogin;
  const factory RegisterSingleTimeEvent.navigateToEmailVerification() = _NavigateToEmailVerification;
}
