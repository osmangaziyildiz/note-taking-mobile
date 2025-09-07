import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_event.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_state.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const RegisterState()) {
    on<RegisterEvent>(_onRegisterEvent);
  }
  
  final AuthRepository _authRepository;

  Future<void> _onRegisterEvent(
    RegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    await event.when(
      nameChanged: (name) async => _onNameChanged(name, emit),
      emailChanged: (email) async => _onEmailChanged(email, emit),
      passwordChanged: (password) async => _onPasswordChanged(password, emit),
      confirmPasswordChanged: (confirmPassword) async => _onConfirmPasswordChanged(confirmPassword, emit),
      submitPressed: () async => _onSubmitPressed(emit),
      signInWithGooglePressed: () async => _onSignInWithGooglePressed(emit),
      sendEmailVerification: () async => _onSendEmailVerification(emit),
      checkEmailVerification: () async => _onCheckEmailVerification(emit),
      clearForm: () async => _onClearForm(emit),
      clearSingleTimeEvent: () async => _onClearSingleTimeEvent(emit),
    );
  }

  void _onNameChanged(String name, Emitter<RegisterState> emit) {
    // Name is optional, but if provided, must be at least 4 characters
    final isNameValid = name.trim().isEmpty || name.trim().length >= 4;
    emit(state.copyWith(
      name: name,
      isNameValid: isNameValid,
      nameError: isNameValid ? null : 'Name must be at least 4 characters',
      isFormValid: isNameValid && state.isEmailValid && state.isPasswordValid && state.isConfirmPasswordValid,
    ));
  }

  void _onEmailChanged(String email, Emitter<RegisterState> emit) {
    final isEmailValid = _isValidEmail(email);
    emit(state.copyWith(
      email: email,
      isEmailValid: isEmailValid,
      emailError: isEmailValid ? null : 'Please enter a valid email',
      isFormValid: state.isNameValid && isEmailValid && state.isPasswordValid && state.isConfirmPasswordValid,
    ));
  }

  void _onPasswordChanged(String password, Emitter<RegisterState> emit) {
    final isPasswordValid = password.length >= 6;
    final isConfirmPasswordValid = password == state.confirmPassword && password.isNotEmpty;
    
    emit(state.copyWith(
      password: password,
      isPasswordValid: isPasswordValid,
      passwordError: isPasswordValid ? null : 'Password must be at least 6 characters',
      isConfirmPasswordValid: isConfirmPasswordValid,
      confirmPasswordError: isConfirmPasswordValid ? null : 'Passwords do not match',
      isFormValid: state.isNameValid && state.isEmailValid && isPasswordValid && isConfirmPasswordValid,
    ));
  }

  void _onConfirmPasswordChanged(String confirmPassword, Emitter<RegisterState> emit) {
    final isConfirmPasswordValid = confirmPassword == state.password && confirmPassword.isNotEmpty;
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isConfirmPasswordValid: isConfirmPasswordValid,
      confirmPasswordError: isConfirmPasswordValid ? null : 'Passwords do not match',
      isFormValid: state.isNameValid && state.isEmailValid && state.isPasswordValid && isConfirmPasswordValid,
    ));
  }

  Future<void> _onSubmitPressed(Emitter<RegisterState> emit) async {
    if (!state.isFormValid) return;

    emit(state.copyWith(isLoading: true));

    final result = await _authRepository.registerWithEmailAndPassword(
      email: state.email.trim(),
      password: state.password,
      displayName: state.name.trim(),
    );

    await result.fold(
      (error) async => emit(state.copyWith(
        isLoading: false,
        singleTimeEvent: RegisterSingleTimeEvent.showErrorDialog(error),
      )),
      (user) async {
        // Get and print the ID token
        final tokenResult = await _authRepository.getIdToken();
        tokenResult.fold(
          (error) => debugPrint('❌ Token not found: $error'),
          (token) {
            debugPrint('🎉 REGISTRATION SUCCESSFUL!');
            debugPrint('👤 User ID: ${user.id}');
            debugPrint('📧 Email: ${user.email}');
            debugPrint('👤 Display Name: ${user.displayName}');
            debugPrint('💾 User saved to Firestore: ${user.id}');
            debugPrint('🔑 ID Token: $token');
            debugPrint('🔑 Token Length: ${token.length}');
            debugPrint('🔑 Token Preview: ${token.substring(0, 50)}...');
          },
        );

        // Registration successful - trigger navigation event
        emit(state.copyWith(
          isLoading: false,
          singleTimeEvent: const RegisterSingleTimeEvent.navigateToHome(),
        ));
      },
    );
  }

  Future<void> _onSignInWithGooglePressed(Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _authRepository.signInWithGoogle();

    await result.fold(
      (error) async => emit(state.copyWith(
        isLoading: false,
        singleTimeEvent: RegisterSingleTimeEvent.showErrorDialog(error),
      )),
      (user) async {
        // Get and print the ID token
        final tokenResult = await _authRepository.getIdToken();
        tokenResult.fold(
          (error) => debugPrint('❌ Token not found: $error'),
          (token) {
            debugPrint('🎉 GOOGLE REGISTRATION SUCCESSFUL!');
            debugPrint('👤 User ID: ${user.id}');
            debugPrint('📧 Email: ${user.email}');
            debugPrint('👤 Display Name: ${user.displayName}');
            debugPrint('💾 User saved to Firestore: ${user.id}');
            debugPrint('🔑 ID Token: $token');
            debugPrint('🔑 Token Length: ${token.length}');
            debugPrint('🔑 Token Preview: ${token.substring(0, 50)}...');
          },
        );

        // Registration successful - trigger navigation to email verification
        emit(state.copyWith(
          isLoading: false,
          singleTimeEvent: const RegisterSingleTimeEvent.navigateToEmailVerification(),
        ));
      },
    );
  }

  Future<void> _onSendEmailVerification(Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _authRepository.sendEmailVerification();

    await result.fold(
      (error) async => emit(state.copyWith(
        isLoading: false,
        singleTimeEvent: RegisterSingleTimeEvent.showErrorDialog(error),
      )),
      (success) async => emit(state.copyWith(
        isLoading: false,
        isEmailVerificationSent: true,
        singleTimeEvent: const RegisterSingleTimeEvent.showSuccessDialog(
          'Verification email sent! Please check your inbox.',
        ),
      )),
    );
  }

  Future<void> _onCheckEmailVerification(Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _authRepository.checkEmailVerification();

    await result.fold(
      (error) async => emit(state.copyWith(
        isLoading: false,
        singleTimeEvent: RegisterSingleTimeEvent.showErrorDialog(error),
      )),
      (success) async => emit(state.copyWith(
        isLoading: false,
        isEmailVerified: true,
        singleTimeEvent: const RegisterSingleTimeEvent.navigateToHome(),
      )),
    );
  }

  void _onClearForm(Emitter<RegisterState> emit) {
    emit(const RegisterState());
  }

  void _onClearSingleTimeEvent(Emitter<RegisterState> emit) {
    emit(state.copyWith(singleTimeEvent: null));
  }

  void clearSingleTimeEvent() {
    add(const RegisterEvent.clearSingleTimeEvent());
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
