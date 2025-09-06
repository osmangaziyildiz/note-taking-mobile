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
        backgroundColor: const Color(0xFF1E1E1E),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(context),
                const SizedBox(height: 20),
                
                // Search Bar
                _buildSearchBar(),
                const SizedBox(height: 20),
                
                // Category Filters
                _buildCategoryFilters(),
                const SizedBox(height: 20),
                
                // Notes List
                Expanded(
                  child: _buildNotesList(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search notes',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    final categories = ['All Notes', 'Work', 'Personal', 'Ideas'];
    
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement category filtering
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected 
                    ? const Color(0xFFE53E3E) 
                    : const Color(0xFF2C2C2C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(
                categories[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNotesList() {
    final notes = [
      {
        'title': 'Team Meeting',
        'description': 'Meeting notes from the team meeting',
        'category': 'Work',
      },
      {
        'title': 'Project Ideas',
        'description': 'Ideas for the new project',
        'category': 'Ideas',
      },
      {
        'title': 'Grocery List',
        'description': 'Grocery list for the week',
        'category': 'Personal',
      },
      {
        'title': 'Book Review',
        'description': 'Quick thoughts on the book',
        'category': 'Personal',
      },
    ];

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note['title']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                note['description']!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // TODO: Navigate to add note screen
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