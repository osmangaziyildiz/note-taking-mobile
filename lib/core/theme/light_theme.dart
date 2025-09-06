import 'package:flutter/material.dart';
import 'package:notetakingapp/core/theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.lightBackground,
  hintColor: AppColors.lightTextColor,
  primaryColorLight: AppColors.lightButtonBackground,
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
    decorationColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.lightButtonBackground,
      foregroundColor: AppColors.lightButtonText,
      elevation: 2,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34),
      borderSide: BorderSide(color: AppColors.black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34),
      borderSide: BorderSide(color: AppColors.black, width: 2),
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
