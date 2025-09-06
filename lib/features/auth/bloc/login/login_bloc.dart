import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_event.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_state.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';

// Login bloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  // Auth repository
  final AuthRepository _authRepository;

  // Login event
  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    await event.when(
      emailChanged: (email) async => _onEmailChanged(email, emit),
      passwordChanged: (password) async => _onPasswordChanged(password, emit),
      submitPressed: () async => _onSubmitPressed(emit),
      signInWithGooglePressed: () async => _onSignInWithGooglePressed(emit),
      clearForm: () async => _onClearForm(emit),
      clearSingleTimeEvent: () async => _onClearSingleTimeEvent(emit),
    );
  }

  // Email changed event
  void _onEmailChanged(String email, Emitter<LoginState> emit) {
    final isEmailValid = _isValidEmail(email);
    emit(state.copyWith(
      email: email,
      isEmailValid: isEmailValid,
      emailError: isEmailValid ? null : 'Please enter a valid email',
      isFormValid: isEmailValid && state.isPasswordValid,
    ));
  }

  // Password changed event
  void _onPasswordChanged(String password, Emitter<LoginState> emit) {
    final isPasswordValid = password.length >= 6;
    emit(state.copyWith(
      password: password,
      isPasswordValid: isPasswordValid,
      passwordError: isPasswordValid ? null : 'Password must be at least 6 characters',
      isFormValid: state.isEmailValid && isPasswordValid,
    ));
  }

  // Submit pressed event
  Future<void> _onSubmitPressed(Emitter<LoginState> emit) async {
    if (!state.isFormValid) return;

    emit(state.copyWith(
      isLoading: true,
    ));

    final result = await _authRepository.loginWithEmailAndPassword(
      email: state.email.trim(),
      password: state.password,
    );

    await result.fold(
      (error) async => emit(state.copyWith(
        isLoading: false,
        singleTimeEvent: LoginSingleTimeEvent.showErrorDialog(error),
      )),
      (user) async {
        // Get and print the ID token
        final tokenResult = await _authRepository.getIdToken();
        tokenResult.fold(
          (error) => debugPrint('❌ Token not found: $error'),
          (token) {
            debugPrint('🎉 LOGIN SUCCESSFUL!');
            debugPrint('👤 User ID: ${user.id}');
            debugPrint('📧 Email: ${user.email}');
            debugPrint('🔑 ID Token: $token');
            debugPrint('🔑 Token Length: ${token.length}');
            debugPrint('🔑 Token Preview: ${token.substring(0, 50)}...');
          },
        );

        // Login successful - trigger navigation event
        emit(state.copyWith(
          isLoading: false,
          singleTimeEvent: const LoginSingleTimeEvent.navigateToHome(),
        ));
      },
    );
  }

  // Sign in with Google pressed event
  Future<void> _onSignInWithGooglePressed(Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _authRepository.signInWithGoogle();

    await result.fold(
      (error) async => emit(state.copyWith(
        isLoading: false,
        singleTimeEvent: LoginSingleTimeEvent.showErrorDialog(error),
      )),
      (user) async {
        // Get and print the ID token
        final tokenResult = await _authRepository.getIdToken();
        tokenResult.fold(
          (error) => debugPrint('❌ Token not found: $error'),
          (token) {
            debugPrint('🎉 GOOGLE LOGIN SUCCESSFUL!');
            debugPrint('👤 User ID: ${user.id}');
            debugPrint('📧 Email: ${user.email}');
            debugPrint('👤 Display Name: ${user.displayName}');
            debugPrint('🔑 ID Token: $token');
            debugPrint('🔑 Token Length: ${token.length}');
            debugPrint('🔑 Token Preview: ${token.substring(0, 50)}...');
          },
        );

        // Login successful - trigger navigation event
        emit(state.copyWith(
          isLoading: false,
          singleTimeEvent: const LoginSingleTimeEvent.navigateToHome(),
        ));
      },
    );
  }

  // Clear form event
  void _onClearForm(Emitter<LoginState> emit) {
    emit(const LoginState());
  }

  // Clear single time event
  void _onClearSingleTimeEvent(Emitter<LoginState> emit) {
    emit(state.copyWith(singleTimeEvent: null));
  }

  void clearSingleTimeEvent() {
    add(const LoginEvent.clearSingleTimeEvent());
  }

  // Helper method to check if email is valid
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
