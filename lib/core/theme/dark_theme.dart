import 'package:flutter/material.dart';
import 'package:notetakingapp/core/theme/app_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  hintColor: AppColors.darkTextColor,
  primaryColorLight: AppColors.darkButtonBackground,
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    decorationColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkButtonBackground,
      foregroundColor: AppColors.darkButtonText,
      elevation: 2,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34),
      borderSide: const BorderSide(color: Colors.yellow),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34),
      borderSide: const BorderSide(color: Colors.yellow, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
  ),
);
