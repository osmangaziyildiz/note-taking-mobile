import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notetakingapp/core/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // Check current user
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // User is logged in, redirect to home
      resolver.next();
    } else {
      // User is not logged in, redirect to login
      router.replaceAll([const LoginRoute()]);
    }
  }
}
