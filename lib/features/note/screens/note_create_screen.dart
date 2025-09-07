import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/core/utils/snackbar_helper.dart';
import 'package:notetakingapp/features/note/bloc/create/note_create_bloc.dart';
import 'package:notetakingapp/features/note/bloc/create/note_create_event.dart';
import 'package:notetakingapp/features/note/bloc/create/note_create_state.dart';

@RoutePage()
class NoteCreateScreen extends StatefulWidget {
  const NoteCreateScreen({super.key});

  @override
  State<NoteCreateScreen> createState() => _NoteCreateScreenState();
}

class _NoteCreateScreenState extends State<NoteCreateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    
    // Listen to title changes
    _titleController.addListener(() {
      context.read<NoteCreateBloc>().add(
        NoteCreateEvent.titleChanged(_titleController.text),
      );
    });
    
    // Listen to content changes
    _contentController.addListener(() {
      context.read<NoteCreateBloc>().add(
        NoteCreateEvent.contentChanged(_contentController.text),
      );
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<NoteCreateBloc>(),
      child: BlocListener<NoteCreateBloc, NoteCreateState>(
        listener: (context, state) {
          state.singleTimeEvent?.when(
            showErrorDialog: (message) {
              SnackbarHelper.showError(
                context: context,
                title: 'Error'.localized,
                message: message,
              );
              context.read<NoteCreateBloc>().clearSingleTimeEvent();
            },
            showSuccessDialog: (message) {
              SnackbarHelper.showSuccess(
                context: context,
                title: 'Success'.localized,
                message: message,
              );
              // Navigate back after showing success message
              if (mounted) {
                context.router.maybePop();
              }
              context.read<NoteCreateBloc>().clearSingleTimeEvent();
            },
            navigateToHome: () {
              context.router.maybePop();
            },
          );
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF1E1E1E),
          appBar: AppBar(
            backgroundColor: const Color(0xFF1E1E1E),
            foregroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Create Note'.localized,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: [
              BlocBuilder<NoteCreateBloc, NoteCreateState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            context.read<NoteCreateBloc>().add(
                              const NoteCreateEvent.submitPressed(),
                            );
                          },
                    child: state.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            'Save'.localized,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Title Input
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _titleController,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Note title...'.localized,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Content Editor
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _contentController,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Start writing your note...'.localized,
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
