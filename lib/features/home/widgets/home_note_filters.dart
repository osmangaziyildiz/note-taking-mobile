import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';

enum NoteFilter {
  all,
  favorites,
}

class HomeNoteFilters extends StatelessWidget {
  const HomeNoteFilters({
    required this.selectedFilter,
    required this.onFilterChanged,
    super.key,
  });

  final NoteFilter selectedFilter;
  final ValueChanged<NoteFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: Row(
        children: [
          // All Notes filter
          Expanded(
            child: GestureDetector(
              onTap: () => onFilterChanged(NoteFilter.all),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: selectedFilter == NoteFilter.all
                      ? const Color(0xFFE53E3E)
                      : const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'All Notes'.localized,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Favorites filter
          Expanded(
            child: GestureDetector(
              onTap: () => onFilterChanged(NoteFilter.favorites),
              child: Container(
                margin: EdgeInsets.only(left: 8.w),
                decoration: BoxDecoration(
                  color: selectedFilter == NoteFilter.favorites
                      ? const Color(0xFFE53E3E)
                      : const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: selectedFilter == NoteFilter.favorites
                            ? Colors.amber
                            : Colors.grey,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Favorites'.localized,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
