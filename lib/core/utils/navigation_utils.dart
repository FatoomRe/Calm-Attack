/// Navigation utilities for the Calm Attack application.
///
/// This file contains helper functions and utilities for handling
/// navigation throughout the app in a consistent manner.

import 'package:flutter/material.dart';

/// Navigation utilities class containing helper methods for app navigation.
///
/// This class provides centralized navigation logic to maintain consistency
/// and reduce code duplication across different screens.
class NavigationUtils {
  /// Navigates to a new screen using a standard slide transition.
  ///
  /// [context] - The build context for navigation
  /// [screen] - The widget/screen to navigate to
  /// [replacement] - If true, replaces current screen instead of pushing
  static Future<void> navigateToScreen(
    BuildContext context,
    Widget screen, {
    bool replacement = false,
  }) async {
    final route = MaterialPageRoute(builder: (context) => screen);

    if (replacement) {
      await Navigator.pushReplacement(context, route);
    } else {
      await Navigator.push(context, route);
    }
  }

  /// Navigates back to the previous screen.
  ///
  /// [context] - The build context for navigation
  /// [result] - Optional result to pass back to previous screen
  static void goBack(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }

  /// Navigates to a screen and clears the entire navigation stack.
  ///
  /// [context] - The build context for navigation
  /// [screen] - The widget/screen to navigate to
  static Future<void> navigateAndClearStack(
    BuildContext context,
    Widget screen,
  ) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }

  /// Shows a confirmation dialog before navigation.
  ///
  /// [context] - The build context for showing dialog
  /// [title] - Dialog title
  /// [message] - Dialog message
  /// [onConfirm] - Callback when user confirms
  /// [confirmText] - Text for confirm button (defaults to "Yes")
  /// [cancelText] - Text for cancel button (defaults to "No")
  static Future<void> showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }

  /// Shows a snackbar with a message.
  ///
  /// [context] - The build context for showing snackbar
  /// [message] - Message to display
  /// [duration] - How long to show the snackbar (optional)
  /// [action] - Optional action button
  static void showSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Private constructor to prevent instantiation
  NavigationUtils._();
}
