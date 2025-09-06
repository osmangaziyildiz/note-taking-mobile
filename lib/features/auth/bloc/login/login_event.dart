import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

// Event for login screen
@freezed
class LoginEvent with _$LoginEvent {
  // Email changed event
  const factory LoginEvent.emailChanged(String email) = _EmailChanged;
  
  // Password changed event
  const factory LoginEvent.passwordChanged(String password) = _PasswordChanged;

  // Submit pressed event
  
  const factory LoginEvent.submitPressed() = _SubmitPressed;
  
  // Sign in with Google pressed event
  const factory LoginEvent.signInWithGooglePressed() = _SignInWithGooglePressed;
  
  // Clear form event
  const factory LoginEvent.clearForm() = _ClearForm;

  // Clear single time event  
  const factory LoginEvent.clearSingleTimeEvent() = _ClearSingleTimeEvent;
}
