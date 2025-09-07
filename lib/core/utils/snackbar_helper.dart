import 'package:flutter/material.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackbarHelper {
  static void showSuccess({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message.localized,
      ),
    );
  }

  static void showError({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message.localized,
      ),
    );
  }

  static void showWarning({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message.localized,
      ),
    );
  }

  static void showInfo({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message.localized,
      ),
    );
  }
}
