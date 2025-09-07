import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_event.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Notes',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                // TODO: Implement search functionality
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
