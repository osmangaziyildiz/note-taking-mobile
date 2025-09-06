import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/features/auth/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<String, UserModel>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  Future<Either<String, UserModel>> signInWithGoogle();
  
  Future<Either<String, Unit>> logout();
  
  Future<Either<String, UserModel?>> getCurrentUser();
  
  Future<Either<String, String>> getIdToken();
  
  Stream<UserModel?> get authStateChanges;
}
