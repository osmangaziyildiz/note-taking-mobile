import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/core/utils/snackbar_helper.dart';
import 'package:notetakingapp/features/note/bloc/edit/note_edit_bloc.dart';
import 'package:notetakingapp/features/note/bloc/edit/note_edit_event.dart';
import 'package:notetakingapp/features/note/bloc/edit/note_edit_state.dart';

@RoutePage()
class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({
    required this.noteId,
    super.key,
  });

  final String noteId;

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _showDeleteConfirmationDialog(NoteEditBloc bloc) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2C2C2C),
          title:  Text(
            'Delete Note'.localized,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete this note? This action cannot be undone.'.localized,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel'.localized,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            BlocBuilder<NoteEditBloc, NoteEditState>(
              bloc: bloc, // Use the passed bloc instance
              builder: (context, state) {
                return TextButton(
                  onPressed: state.isDeleting
                      ? null
                      : () {
                          Navigator.of(context).pop();
                          bloc.add(
                            const NoteEditEvent.confirmDelete(),
                          );
                        },
                  child: state.isDeleting
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.red,
                            ),
                          ),
                        )
                      : Text(
                          'Delete'.localized,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = sl.get<NoteEditBloc>()
          ..add(NoteEditEvent.loadNote(widget.noteId));
        return bloc;
      },
      child: BlocConsumer<NoteEditBloc, NoteEditState>(
        listener: (context, state) {
          // Handle single time events
          state.singleTimeEvent?.when(
            showErrorDialog: (message) {
              SnackbarHelper.showError(
                context: context,
                title: 'Error'.localized,
                message: message,
              );
              context.read<NoteEditBloc>().clearSingleTimeEvent();
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
              context.read<NoteEditBloc>().clearSingleTimeEvent();
            },
            navigateToHome: () {
              context.router.maybePop();
            },
            showDeleteConfirmation: () {
              _showDeleteConfirmationDialog(context.read<NoteEditBloc>());
              context.read<NoteEditBloc>().clearSingleTimeEvent();
            },
          );

          // Update text controllers when note is loaded
          if (state.note != null && _titleController.text != state.title) {
            _titleController.text = state.title;
          }
          if (state.note != null && _contentController.text != state.content) {
            _contentController.text = state.content;
          }
        },
        builder: (context, state) {
          // Setup listeners with the same bloc instance
          final bloc = context.read<NoteEditBloc>();

          // Remove existing listeners to avoid duplicates
          _titleController.removeListener(() {});
          _contentController.removeListener(() {});

          // Add listeners with the correct bloc instance
          _titleController.addListener(() {
            bloc.add(
              NoteEditEvent.titleChanged(_titleController.text),
            );
          });

          _contentController.addListener(() {
            bloc.add(
              NoteEditEvent.contentChanged(_contentController.text),
            );
          });

          return Scaffold(
            backgroundColor: const Color(0xFF1E1E1E),
            appBar: AppBar(
              backgroundColor: const Color(0xFF1E1E1E),
              foregroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Edit Note'.localized,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              actions: [
                // Delete button
                BlocBuilder<NoteEditBloc, NoteEditState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: state.isLoading || state.isDeleting
                          ? null
                          : () {
                              context.read<NoteEditBloc>().add(
                                const NoteEditEvent.deletePressed(),
                              );
                            },
                      icon: state.isDeleting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.red,
                                ),
                              ),
                            )
                          : const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 24,
                            ),
                    );
                  },
                ),
                // Save button
                BlocBuilder<NoteEditBloc, NoteEditState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: state.isLoading || state.isDeleting
                          ? null
                          : () {
                              context.read<NoteEditBloc>().add(
                                const NoteEditEvent.submitPressed(),
                              );
                            },
                      child: state.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
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
            body: Builder(
              builder: (context) {
                if (state.isLoading && state.note == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  );
                }

                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Title Input
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
