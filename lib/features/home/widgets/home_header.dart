import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notetakingapp/core/router/app_router.dart';

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
          ),
        ),
        IconButton(
          onPressed: () {
            context.router.push(const SettingsRoute());
          },
          icon: const Icon(
            Icons.settings,
            size: 24,
          ),
        ),
      ],
    );
  }
}
