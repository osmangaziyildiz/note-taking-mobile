import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/features/home/bloc/home_bloc.dart';
import 'package:notetakingapp/features/home/bloc/home_state.dart';

class HomeNotesList extends StatelessWidget {
  const HomeNotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE53E3E)),
            ),
          );
        }

        if (state.notes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.note_add_outlined,
                  size: 64.sp,
                  color: const Color(0xFF8E8E93),
                ),
                SizedBox(height: 16.h),
                Text(
                  'No notes yet',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Create your first note',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: state.notes.length,
          itemBuilder: (context, index) {
            final note = state.notes[index];
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
              if (note.isFavorite)
                Icon(
                  Icons.favorite,
                  color: const Color(0xFFE53E3E),
                  size: 16.sp,
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
            'Created: ${_formatDate(note.createdAt)}',
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
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
