import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_event.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_state.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.initial()) {
    on<AuthEvent>(_onAuthEvent);

    // Dynamic sync with auth state stream
    _authRepository.authStateChanges.listen((user) {
      if (user != null) {
        add(const AuthEvent.checkAuthStatus());
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }
  
  final AuthRepository _authRepository;

  Future<void> _onAuthEvent(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await event.when(
      checkAuthStatus: () async => _onCheckAuthStatus(emit),
      logout: () async => _onLogout(emit),
    );
  }

  Future<void> _onCheckAuthStatus(Emitter<AuthState> emit) async {
    final result = await _authRepository.getCurrentUser();
    result.fold(
      (err) {
        emit(AuthState.error(message: err));
      },
      (user) {
        if (user != null) {
          emit(AuthState.authenticated(user: user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    await _authRepository.logout();
    emit(const AuthState.unauthenticated());
  }
}
