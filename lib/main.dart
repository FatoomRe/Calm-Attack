/// Main entry point for the Calm Attack application.
///
/// This file initializes the Flutter app with proper configuration
/// and sets up the initial route to the start screen.

import 'package:flutter/material.dart';
import 'Pages/start_screen.dart';
import 'core/constants/app_constants.dart';

/// Main function that starts the Calm Attack application.
///
/// This function initializes the Flutter app with:
/// - Disabled debug banner for a cleaner look
/// - Proper material design configuration
/// - Initial route to the start screen
void main() {
  runApp(const CalmAttackApp());
}

/// Root application widget for Calm Attack.
///
/// This widget configures the MaterialApp with consistent theming
/// and navigation setup for the entire application.
class CalmAttackApp extends StatelessWidget {
  const CalmAttackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App configuration
      title: 'Calm Attack',
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: ThemeData(
        // Primary color scheme
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primaryDark,

        // Color scheme for Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDark,
          primary: AppColors.primaryDark,
          secondary: AppColors.accentTeal,
        ),

        // App bar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: AppColors.textOnPrimary,
          elevation: AppSizes.buttonElevation,
        ),

        // Elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.textOnPrimary,
            elevation: AppSizes.buttonElevation,
            textStyle: AppTextStyles.buttonLarge,
          ),
        ),

        // Text button theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryDark,
          ),
        ),

        // Ensure proper contrast and accessibility
        useMaterial3: true,
      ),

      // Initial route
      home: const Scaffold(
        body: StartScreen(),
      ),
    );
  }
}
