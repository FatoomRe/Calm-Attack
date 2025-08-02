/// Start screen for the Calm Attack application.
///
/// This screen serves as the main entry point where users begin their
/// panic attack management session. It provides a welcoming interface
/// with clear call-to-action to start the breathing exercise.

import 'dart:math';
import 'package:flutter/material.dart';

import 'breathing_screen.dart';
import '../core/constants/app_constants.dart';
import '../core/widgets/common_widgets.dart';
import '../core/utils/navigation_utils.dart';
import '../core/utils/session_utils.dart';

/// The start screen widget that welcomes users and initiates sessions.
///
/// This screen displays:
/// - A welcoming panic attack question
/// - App branding image
/// - Get Started button to begin the session
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppSizes.spacingMedium),

              // Main welcome message
              const ScreenHeader(
                title: 'Are you having a\nPanic Attack?',
                titleStyle: AppTextStyles.heading1,
              ),

              const SizedBox(height: AppSizes.spacingMedium),

              // App branding image with rotation
              _buildBrandingImage(screenSize),

              const SizedBox(height: AppSizes.spacingXLarge),

              // Get Started button
              _buildGetStartedButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the rotated branding image.
  ///
  /// The image is rotated by -17.8 degrees for visual appeal
  /// and scaled responsively based on screen size.
  Widget _buildBrandingImage(Size screenSize) {
    return Transform.rotate(
      angle: -17.8 * pi / 180, // Rotating the image by -17.8 degrees
      child: Image.asset(
        AppImages.panicAttackImage,
        width: screenSize.width * AppSizes.imageWidthRatio,
      ),
    );
  }

  /// Builds the Get Started button with session initialization.
  ///
  /// When pressed, this button:
  /// 1. Creates a new session start time
  /// 2. Navigates to the breathing screen
  /// 3. Passes the session start time for tracking
  Widget _buildGetStartedButton(BuildContext context) {
    return AppElevatedButton(
      text: 'Get Started',
      onPressed: () => _handleGetStarted(context),
    );
  }

  /// Handles the Get Started button press.
  ///
  /// Creates a new session and navigates to the breathing screen.
  void _handleGetStarted(BuildContext context) {
    final startTime = SessionUtils.createSessionStart();

    NavigationUtils.navigateToScreen(
      context,
      BreathingScreen(startTime: startTime),
    );
  }
}
