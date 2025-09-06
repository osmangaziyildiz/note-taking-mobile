import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notetakingapp/features/auth/models/user_model.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
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
      final userModel = UserModel(
        id: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        isEmailVerified: user.emailVerified,
        createdAt: user.metadata.creationTime,
        updatedAt: user.metadata.lastSignInTime,
      );

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      return left(_getErrorMessage(e.code));
    } on Exception catch (e) {
      return left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, UserModel>> signInWithGoogle() async {
    try {

      await _googleSignIn.initialize();
      
      // Trigger the authentication flow with scopes
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );
      
      if (googleUser == null) {
        return left('Google sign-in was cancelled by user');
      }

      // Get authorization for the user
      final auth = await googleUser.authorizationClient.authorizationForScopes(['email', 'profile']);
      
      if (auth == null) {
        return left('Failed to get Google authorization');
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
      );

      // Sign in to Firebase with the Google credential
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      
      if (userCredential.user == null) {
        return left('Failed to sign in with Google');
      }

      final user = userCredential.user!;
      final userModel = UserModel(
        id: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        isEmailVerified: user.emailVerified,
        createdAt: user.metadata.creationTime,
        updatedAt: user.metadata.lastSignInTime,
      );

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      return left(_getErrorMessage(e.code));
    } on Exception catch (e) {
      return left('An unexpected error occurred during Google sign-in: $e');
    }
  }

  @override
  Future<Either<String, Unit>> logout() async {
    try {
      await _firebaseAuth.signOut();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(_getErrorMessage(e.code));
    } on Exception catch (e) {
      return left('Error occurred while logging out: $e');
    }
  }

  @override
  Future<Either<String, UserModel?>> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return right(null);
      }

      final userModel = UserModel(
        id: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        isEmailVerified: user.emailVerified,
        createdAt: user.metadata.creationTime,
        updatedAt: user.metadata.lastSignInTime,
      );

      return right(userModel);
    } on FirebaseAuthException catch (e) {
      return left(_getErrorMessage(e.code));
    } on Exception catch (e) {
      return left('Error occurred while getting user information: $e');
    }
  }

  @override
  Future<Either<String, String>> getIdToken() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return left('No user is currently signed in');
      }

      final token = await user.getIdToken();
      if (token == null) {
        return left('Failed to get ID token');
      }
      return right(token);
    } on FirebaseAuthException catch (e) {
      return left(_getErrorMessage(e.code));
    } on Exception catch (e) {
      return left('Error occurred while getting ID token: $e');
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user == null) return null;
      
      return UserModel(
        id: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        isEmailVerified: user.emailVerified,
        createdAt: user.metadata.creationTime,
        updatedAt: user.metadata.lastSignInTime,
      );
    });
  }

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
}
