import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/core/theme/app_theme.dart';
import 'package:notetakingapp/core/theme/bloc/theme_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_event.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_bloc.dart';
import 'package:notetakingapp/features/home/bloc/home_bloc.dart';
import 'package:notetakingapp/features/note/bloc/create/note_create_bloc.dart';
import 'package:notetakingapp/features/note/bloc/edit/note_edit_bloc.dart';
import 'package:notetakingapp/firebase_options.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize LocalizationManager
  await LocalizationManager.init();
  debugPrint('✅ LocalizationManager initialized successfully!');

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize service locator
  await initServiceLocator();

  // Initialize ScreenUtil
  await ScreenUtil.ensureScreenSize();
  FlutterNativeSplash.remove();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => sl.get<ThemeBloc>()..loadThemeMode(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) {
            final authBloc = sl.get<AuthBloc>()
            ..add(const AuthEvent.checkAuthStatus());
            return authBloc;
          },
        ),
        BlocProvider<LoginBloc>(
          create: (context) => sl.get<LoginBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => sl.get<HomeBloc>(),
        ),
        BlocProvider<NoteCreateBloc>(
          create: (context) => sl.get<NoteCreateBloc>(),
        ),
        BlocProvider<NoteEditBloc>(
          create: (context) => sl.get<NoteEditBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'NoteTakingApp',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: state.themeMode,
                routerConfig: appRouter.config(),
              );
            },
          );
        },
      ),
    );
  }
}
