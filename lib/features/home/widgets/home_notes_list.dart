import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/features/home/bloc/home_bloc.dart';
import 'package:notetakingapp/features/home/bloc/home_event.dart';
import 'package:notetakingapp/features/home/bloc/home_state.dart';
import 'package:notetakingapp/features/home/widgets/home_note_filters.dart';

class HomeNotesList extends StatelessWidget {
  const HomeNotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // Filter notes based on selected filter
        final filteredNotes = _filterNotes(state.notes, state.selectedFilter);
        
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE53E3E)),
            ),
          );
        }

        if (filteredNotes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  state.selectedFilter == NoteFilter.favorites 
                      ? Icons.star_outline 
                      : Icons.note_add_outlined,
                  size: 64.sp,
                  color: const Color(0xFF8E8E93),
                ),
                SizedBox(height: 16.h),
                Text(
                  state.selectedFilter == NoteFilter.favorites 
                      ? 'No favorite notes yet'.localized
                      : 'No notes yet'.localized,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Add your first favorite note'.localized,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: filteredNotes.length,
          itemBuilder: (context, index) {
            final note = filteredNotes[index];
            return _NoteCard(
              note: note,
              onTap: () {
                context.router.push(NoteEditRoute(noteId: note.id));
              },
            );
          },
        );
      },
    );
  }

  List<NoteModel> _filterNotes(List<NoteModel> notes, NoteFilter filter) {
    switch (filter) {
      case NoteFilter.all:
        return notes;
      case NoteFilter.favorites:
        return notes.where((note) => note.isFavorite).toList();
    }
  }
}

class _NoteCard extends StatelessWidget {

  const _NoteCard({
    required this.note,
    required this.onTap,
  });
  
  final NoteModel note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    note.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<HomeBloc>().add(HomeEvent.toggleFavorite(note.id));
                },
                child: Icon(
                  note.isFavorite ? Icons.star : Icons.star_border,
                  color: note.isFavorite ? Colors.amber : Colors.grey,
                  size: 25.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            note.content,
            style: TextStyle(
              fontSize: 14.sp,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          if (note.tags.isNotEmpty) ...[
            SizedBox(height: 8.h),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: note.tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE53E3E).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFFE53E3E),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
          SizedBox(height: 8.h),
          Text(
            '${'Created:'.localized} ${_formatDate(note.createdAt)}',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF8E8E93),
            ),
          ),
        ],
      ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today'.localized;
    } else if (difference.inDays == 1) {
      return 'Yesterday'.localized;
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago'.localized;
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
