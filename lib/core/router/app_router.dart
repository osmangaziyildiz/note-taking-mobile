import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notetakingapp/core/router/auth_guard.dart';
import 'package:notetakingapp/features/auth/screen/email_verification_screen.dart';
import 'package:notetakingapp/features/auth/screen/login_screen.dart';
import 'package:notetakingapp/features/auth/screen/register_screen.dart';
import 'package:notetakingapp/features/home/screen/home_screen.dart';
import 'package:notetakingapp/features/note/screens/note_create_screen.dart';
import 'package:notetakingapp/features/note/screens/note_edit_screen.dart';
import 'package:notetakingapp/features/settings/screen/settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
        AutoRoute(page: EmailVerificationRoute.page, path: '/email-verification'),
        AutoRoute(page: HomeRoute.page, path: '/home', initial: true, guards: [AuthGuard()]),
        AutoRoute(page: NoteCreateRoute.page, path: '/note/create', guards: [AuthGuard()]),
        AutoRoute(page: NoteEditRoute.page, path: '/note/edit/:noteId', guards: [AuthGuard()]),
        AutoRoute(page: SettingsRoute.page, path: '/settings', guards: [AuthGuard()]),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
