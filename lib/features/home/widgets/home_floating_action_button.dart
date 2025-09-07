import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notetakingapp/core/router/app_router.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.router.push(const NoteCreateRoute());
      },
      backgroundColor: const Color(0xFFE53E3E),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
