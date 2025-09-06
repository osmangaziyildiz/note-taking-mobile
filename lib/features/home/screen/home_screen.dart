import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/core/utils/snackbar_helper.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_event.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_state.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          authenticated: (user) {},
          unauthenticated: () {
            context.router.replaceAll([const LoginRoute()]);
          },
          error: (message) {
            SnackbarHelper.showError(
              context: context,
              title: 'Error',
              message: message,
            );
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Home!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('You are successfully logged in.'),

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.logout());
                    },
                    icon: const Icon(Icons.logout),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
