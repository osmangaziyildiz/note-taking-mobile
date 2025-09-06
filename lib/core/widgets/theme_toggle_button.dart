import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/theme/app_colors.dart';
import 'package:notetakingapp/core/theme/bloc/theme_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CircleAvatar(
          radius: 20.r,
          backgroundColor: state.themeMode == ThemeMode.light ? AppColors.grey.withValues(alpha: 0.5) : AppColors.white.withValues(alpha: 0.3),
          child: IconButton(
            onPressed: () {
              final newThemeMode = state.themeMode == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
              context.read<ThemeBloc>().add(ThemeEvent.changed(newThemeMode));
            },
            icon: Icon(
              state.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: state.themeMode == ThemeMode.light ? AppColors.black : AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
