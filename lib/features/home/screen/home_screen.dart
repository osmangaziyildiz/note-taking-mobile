import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/core/utils/snackbar_helper.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_state.dart';
import 'package:notetakingapp/features/home/bloc/home_bloc.dart';
import 'package:notetakingapp/features/home/bloc/home_event.dart';
import 'package:notetakingapp/features/home/bloc/home_state.dart';
import 'package:notetakingapp/features/home/widgets/home_floating_action_button.dart';
import 'package:notetakingapp/features/home/widgets/home_header.dart';
import 'package:notetakingapp/features/home/widgets/home_note_filters.dart';
import 'package:notetakingapp/features/home/widgets/home_notes_list.dart';
import 'package:notetakingapp/features/home/widgets/home_search_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load notes when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeEvent.loadNotes());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
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
                  title: 'Error'.localized,
                  message: message,
                );
              },
            );
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.error != null) {
              SnackbarHelper.showError(
                context: context,
                title: 'Error'.localized,
                message: state.error!,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const HomeHeader(),
                const SizedBox(height: 20),

                // Search Bar
                const HomeSearchBar(),
                const SizedBox(height: 20),

                // Note Filters
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return HomeNoteFilters(
                      selectedFilter: state.selectedFilter,
                      onFilterChanged: (filter) {
                        context.read<HomeBloc>().add(
                          HomeEvent.changeFilter(filter),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Notes List
                const Expanded(
                  child: HomeNotesList(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: const HomeFloatingActionButton(),
      ),
    );
  }
}
