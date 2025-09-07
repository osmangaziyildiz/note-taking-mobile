import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notetakingapp/core/database/database.dart';
import 'package:notetakingapp/core/network/connection_service.dart';
import 'package:notetakingapp/core/network/dio_service.dart';
import 'package:notetakingapp/core/repositories/local_note_repository.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
import 'package:notetakingapp/core/repositories/note_repository_impl.dart';
import 'package:notetakingapp/core/repositories/remote_note_repository.dart';
import 'package:notetakingapp/core/services/local_note_service.dart';
import 'package:notetakingapp/core/theme/bloc/theme_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_bloc.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository_impl.dart';
import 'package:notetakingapp/features/home/bloc/home_bloc.dart';
import 'package:notetakingapp/features/note/bloc/create/note_create_bloc.dart';
import 'package:notetakingapp/features/note/bloc/edit/note_edit_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // External
  sl
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance)
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<ConnectionService>(() => ConnectionService()..initialize())
    ..registerLazySingleton<AppDatabase>(AppDatabase.new)
    ..registerLazySingleton<LocalNoteService>(() => LocalNoteService(sl()))
    ..registerLazySingleton<DioService>(() => DioService()..initialize(authRepository: sl()))
    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        firebaseAuth: sl(),
        googleSignIn: sl(),
        firestore: sl(),
      ),
    )
    ..registerLazySingleton<LocalNoteRepository>(() => LocalNoteRepository(sl()))
    ..registerLazySingleton<RemoteNoteRepository>(() => RemoteNoteRepository(sl()))
    ..registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(
        localNoteRepository: sl(),
        remoteNoteRepository: sl(),
        connectionService: sl(),
        authRepository: sl(),
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
    )
    ..registerSingleton<HomeBloc>(
      HomeBloc(
        noteRepository: sl(),
        connectionService: sl(),
      ),
    )
    ..registerSingleton<NoteCreateBloc>(
      NoteCreateBloc(noteRepository: sl()),
    )
    ..registerFactory<NoteEditBloc>(
      () => NoteEditBloc(noteRepository: sl()),
    );
}
