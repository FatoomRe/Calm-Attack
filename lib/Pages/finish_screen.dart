/// Finish screen for the Calm Attack application.
///
/// This screen congratulates users on completing their panic attack
/// management session and displays session statistics including
/// the total time spent in the exercises.

import 'package:flutter/material.dart';

import 'start_screen.dart';
import '../core/constants/app_constants.dart';
import '../core/widgets/common_widgets.dart';
import '../core/utils/navigation_utils.dart';
import '../core/utils/session_utils.dart';

/// The finish screen widget displayed at the end of a session.
///
/// This screen shows:
/// - Congratulatory message
/// - Session completion image
/// - Total time spent in the session
/// - Back to Home button to restart
class FinishScreen extends StatelessWidget {
  /// The start time of the session for calculating duration
  final DateTime startTime;

  const FinishScreen({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenSize = constraints.biggest;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Congratulations header
                  _buildCongratulationsHeader(),

                  const SizedBox(height: AppSizes.spacingSmall),

                  // Motivational message
                  _buildMotivationalMessage(),

                  const SizedBox(height: AppSizes.spacingLarge),

                  // Celebration image
                  _buildCelebrationImage(screenSize),

                  const SizedBox(height: AppSizes.spacingMedium),

                  // Session duration display
                  _buildSessionDuration(),

                  const SizedBox(height: AppSizes.spacingLarge),

                  // Back to Home button
                  _buildBackToHomeButton(context, screenSize),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds the congratulations header text.
  Widget _buildCongratulationsHeader() {
    return Text(
      'Congratulations!',
      style: AppTextStyles.heading1.copyWith(
        fontSize: 40,
        color: AppColors.primaryBlue,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Builds the motivational message text.
  Widget _buildMotivationalMessage() {
    return Text(
      'You survived your panic attack, you are\nin control of your mind and body.',
      style: AppTextStyles.bodyMedium.copyWith(
        fontSize: 18,
        color: AppColors.textPrimary,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Builds the celebration image with responsive sizing.
  Widget _buildCelebrationImage(Size screenSize) {
    return Image.asset(
      AppImages.congratulationsImage,
      width: screenSize.width * 0.75,
      height: screenSize.width * 0.75, // Maintain square aspect ratio
      fit: BoxFit.contain,
    );
  }

  /// Builds the session duration display with formatting.
  Widget _buildSessionDuration() {
    final duration = SessionUtils.calculateSessionDuration(startTime);
    final formattedDuration = SessionUtils.formatDuration(duration);

    return Column(
      children: [
        Text(
          'Total Spent Time',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 20,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          formattedDuration,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 19,
            color: AppColors.primaryBlue,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Builds the Back to Home button with responsive sizing.
  Widget _buildBackToHomeButton(BuildContext context, Size screenSize) {
    return AppElevatedButton(
      text: 'Back to Home',
      widthRatio: 0.53,
      backgroundColor: AppColors.primaryBlue,
      textStyle: AppTextStyles.buttonMedium,
      onPressed: () => _navigateToHome(context),
    );
  }

  /// Navigates back to the start screen and clears the navigation stack.
  void _navigateToHome(BuildContext context) {
    NavigationUtils.navigateAndClearStack(
      context,
      const StartScreen(),
    );
  }
}
