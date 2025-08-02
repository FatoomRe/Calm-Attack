/// Application-wide constants for the Calm Attack app.
///
/// This file contains all the constants used throughout the application
/// to maintain consistency and make the code more maintainable.

import 'package:flutter/material.dart';

/// App-wide color constants
class AppColors {
  // Primary brand colors
  static const Color primaryDark = Color(0xff0F073E);
  static const Color primaryBlue = Color(0xff052D94);
  static const Color gradientStart = Color.fromARGB(255, 38, 59, 173);
  static const Color gradientEnd = Color(0xff00c4b2);

  // Accent colors
  static const Color accentBlue = Color(0xff3E3BD4);
  static const Color accentTeal = Color(0xff1AAC9B);

  // System colors
  static const Color textPrimary = Colors.black;
  static const Color textOnPrimary = Colors.white;
  static const Color background = Colors.white;

  // Prevent instantiation
  AppColors._();
}

/// Text style constants
class AppTextStyles {
  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 43,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 33,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );

  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyTextSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: Colors.grey[700],
  );

  // Button text
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnPrimary,
  );

  // Prevent instantiation
  AppTextStyles._();
}

/// Layout and sizing constants
class AppSizes {
  // Spacing
  static const double spacingXSmall = 8.0;
  static const double spacingSmall = 10.0;
  static const double spacingMedium = 20.0;
  static const double spacingLarge = 25.0;
  static const double spacingXLarge = 90.0;

  // Padding
  static const double smallPadding = 10.0;
  static const double mediumPadding = 20.0;
  static const double largePadding = 30.0;

  // Button dimensions
  static const double buttonHeight = 50.0;
  static const double buttonElevation = 9.0;

  // Screen ratios (as percentage of screen size)
  static const double buttonWidthRatio = 0.45;
  static const double imageWidthRatio = 0.8;
  static const double bubbleSizeRatio = 0.12;

  // Prevent instantiation
  AppSizes._();
}

/// Animation timing constants
class AppDurations {
  static const Duration breathingCycle = Duration(seconds: 3);
  static const Duration holdPhase = Duration(seconds: 3);

  // Prevent instantiation
  AppDurations._();
}

/// Audio asset constants
class AppAudio {
  // Background music for sound therapy
  static const List<String> backgroundMusic = [
    'assets/music-1.mp3',
    'assets/music-2.mp3',
    'assets/music-3.mp3',
    'assets/music-4.mp3',
    'assets/music-5.mp3',
    'assets/music-6.mp3',
  ];

  static const List<String> musicLabels = [
    'Waves',
    'Rain',
    'Birds',
    'Fire',
    'Forest',
    'Wind',
  ];

  // Pop sound effects for bubble game
  static const List<String> popSounds = [
    'assets/pop1.mp3',
    'assets/pop2.mp3',
    'assets/pop3.mp3',
  ];

  // Prevent instantiation
  AppAudio._();
}

/// Image asset constants
class AppImages {
  // Main app images
  static const String panicAttackImage = 'assets/SSAttack.png';
  static const String congratulationsImage = 'assets/cong.png';

  // Breathing exercise images
  static const String inhaleImage = 'assets/INHALE.png';
  static const String holdImage = 'assets/HOLD.png';
  static const String exhaleImage = 'assets/EXHALE.png';

  // Smell exercise images
  static const List<String> smellImages = [
    'assets/Smell/F1.png',
    'assets/Smell/F2.png',
    'assets/Smell/F3.png',
    'assets/Smell/F4.png',
    'assets/Smell/F5.png',
    'assets/Smell/F6.png',
    'assets/Smell/F7.png',
    'assets/Smell/F8.png',
  ];

  // Taste exercise images
  static const List<String> tasteImages = [
    'assets/Taste/cupcake.png',
    'assets/Taste/doughnut.png',
    'assets/Taste/icecream.png',
    'assets/Taste/milkshake.png',
    'assets/Taste/pancake.png',
    'assets/Taste/pineapple.png',
  ];

  // Individual taste images
  static const String cupcake = 'assets/Taste/cupcake.png';
  static const String doughnut = 'assets/Taste/doughnut.png';
  static const String icecream = 'assets/Taste/icecream.png';
  static const String milkshake = 'assets/Taste/milkshake.png';
  static const String pancake = 'assets/Taste/pancake.png';
  static const String pineapple = 'assets/Taste/pineapple.png';

  // Prevent instantiation
  AppImages._();
}

/// Game-specific constants
class GameConstants {
  static const int totalBubbles = 20;
  static const int maxBubbleGenerationAttempts = 1000;

  // Color generation settings
  static const double bubbleColorSaturation = 0.95;
  static const double bubbleColorValue = 0.95;

  // Prevent instantiation
  GameConstants._();
}

/// Breathing exercise constants
class BreathingConstants {
  static const int inhaleSeconds = 3;
  static const int holdSeconds = 3;
  static const int exhaleSeconds = 3;

  // Breathing phases
  static const String inhalePhase = 'INHALE';
  static const String holdPhase = 'HOLD';
  static const String exhalePhase = 'EXHALE';

  // Prevent instantiation
  BreathingConstants._();
}
