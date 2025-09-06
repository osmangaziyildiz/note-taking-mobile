# Error Handling with fpdart

This documentation explains how error handling is implemented using the fpdart library in the project.

## fpdart Either Pattern

### Repository Layer - Error Catching
**Example from: Auth Feature - Login with Email/Password**

```dart
// lib/features/auth/repositories/auth_repository_impl.dart
Future<Either<String, UserModel>> loginWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) {
      return left('User not found');
    }

    final user = credential.user!;
    final userModel = UserModel(/* ... */);
    return right(userModel);
  } on FirebaseAuthException catch (e) {
    return left(_getErrorMessage(e.code));
  } on Exception catch (e) {
    return left('An unexpected error occurred: $e');
  }
}
```

### Bloc Layer - Error Handling
**Example from: Auth Feature - Global Auth State Management**

```dart
// lib/features/auth/bloc/auth/auth_bloc.dart
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
```

## Error Management Strategy

### 1. **Repository Level**
- Catch errors with **try-catch** blocks
- Custom error messages for **FirebaseAuthException**
- Generic error messages for **Generic Exception**
- Return **Either<String, T>** for error/success

### 2. **Bloc Level**
- Process Either with **fold()** method
- **Left (error)** → Switch to Error state
- **Right (success)** → Switch to Success state

### 3. **UI Level**
- Listen to state changes with **BlocListener**
- **Error state** → Show Snackbar or dialog
- **Loading state** → Show loading indicator

## Error Types

### Firebase Auth Errors
**Example from: Auth Feature - Error Message Mapping**

```dart
// lib/features/auth/repositories/auth_repository_impl.dart
String _getErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'user-not-found':
      return 'No user found with this email address';
    case 'invalid-credential':
      return 'Username or password is incorrect';
    case 'user-disabled':
      return 'This account has been disabled';
    case 'too-many-requests':
      return 'Too many failed attempts. Please try again later';
    case 'operation-not-allowed':
      return 'Email/password sign-in is disabled';
    default:
      return 'An error occurred during login: $errorCode';
  }
}
```

### Generic Errors
**Example from: Auth Feature - Exception Handling**

```dart
// lib/features/auth/repositories/auth_repository_impl.dart
on Exception catch (e) {
  return left('An unexpected error occurred: $e');
}
```

## Error Display in UI

### Login Screen Error Handling
**Example from: Auth Feature - Login Screen UI**

```dart
// lib/features/auth/screen/login_screen.dart
BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    state.singleTimeEvent?.when(
      showErrorDialog: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      navigateToHome: () {
        context.router.pushAndClearStack('/home');
      },
    );
  },
  child: // UI Widgets
)
```

## Advantages

### 1. **Type Safety**
- Compile-time error checking
- Safe code with null safety

### 2. **Functional Programming**
- Immutable data structures
- Pure functions
- No side effects

### 3. **Clean Architecture**
- Error isolation with Repository pattern
- State management with Bloc pattern
- Separation of UI from business logic

### 4. **Error Handling**
- Centralized error management
- User-friendly error messages
- Detailed error information for debugging

## Error Flow

**Example Flow: Auth Feature - Login Process**

```
AuthRepository.loginWithEmailAndPassword() (try-catch) 
    ↓
Either<String, UserModel>
    ↓
LoginBloc._onSubmitPressed() (fold)
    ↓
LoginState (error/success)
    ↓
LoginScreen (BlocListener)
    ↓
User Feedback (SnackBar/Dialog)
```

**Real Implementation Path:**
1. **Repository**: `lib/features/auth/repositories/auth_repository_impl.dart`
2. **Bloc**: `lib/features/auth/bloc/login/login_bloc.dart`
3. **UI**: `lib/features/auth/screen/login_screen.dart`
