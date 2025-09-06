import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

// State for login screen
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isFormValid,
    LoginSingleTimeEvent? singleTimeEvent,
    String? emailError,
    String? passwordError,
  }) = _LoginState;
}

// SingleTimeEvent for login screen
@freezed
abstract class LoginSingleTimeEvent with _$LoginSingleTimeEvent {
  const factory LoginSingleTimeEvent.navigateToHome() = _NavigateToHome;
  const factory LoginSingleTimeEvent.showErrorDialog(String message) = _ShowErrorDialog;
}
