import 'package:flutter/material.dart';

class HomeCategoryFilters extends StatelessWidget {
  const HomeCategoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
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
}
