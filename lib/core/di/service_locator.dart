import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notetakingapp/core/theme/bloc/theme_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_bloc.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository_impl.dart';

final GetIt sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // External
  sl
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance)
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        firebaseAuth: sl(),
        googleSignIn: sl(),
        firestore: sl(),
      ),
    )
    // Blocs
    ..registerSingleton<ThemeBloc>(ThemeBloc())
    ..registerSingleton<AuthBloc>(
      AuthBloc(authRepository: sl()),
    )
    ..registerSingleton<LoginBloc>(
      LoginBloc(authRepository: sl()),
    )
    ..registerSingleton<RegisterBloc>(
      RegisterBloc(authRepository: sl()),
    );
}
