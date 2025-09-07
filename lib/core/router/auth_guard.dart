import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notetakingapp/core/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // Check current user
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // User is logged in, check email verification
      if (currentUser.emailVerified) {
        // Email is verified, redirect to home
        resolver.next();
      } else {
        // Email is not verified, redirect to email verification
        router.replaceAll([const EmailVerificationRoute()]);
      }
    } else {
      // User is not logged in, redirect to login
      router.replaceAll([const LoginRoute()]);
    }
  }
}
