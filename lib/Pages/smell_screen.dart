/// Smell screen for the Calm Attack application.
///
/// This screen guides users through a scent-based grounding exercise
/// to help shift their focus and achieve a calmer mental state.
/// Features flower imagery and smell visualization prompts.

import 'package:flutter/material.dart';

import './finish_screen.dart';
import './bubble_pop_game_screen.dart';
import '../core/constants/app_constants.dart';
import '../core/widgets/common_widgets.dart';
import '../core/utils/navigation_utils.dart';

/// The smell screen widget providing scent-based grounding exercise.
///
/// This screen displays:
/// - Decorative flower images positioned around the screen
/// - Central smell prompt for lavender
/// - Alternative instruction text
/// - Navigation buttons for Next/Finish
class SmellScreen extends StatelessWidget {
  /// The start time of the current session for tracking purposes
  final DateTime startTime;

  const SmellScreen({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          ..._buildFlowerImages(screenWidth, screenHeight),
          _buildMainContent(context),
        ],
      ),
    );
  }

  /// Builds all the decorative flower images positioned around the screen.
  List<Widget> _buildFlowerImages(double screenWidth, double screenHeight) {
    return [
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[0],
        top: screenHeight * 0.08,
        left: screenWidth * -0.01,
        width: screenWidth * 0.30,
        height: screenHeight * 0.30,
      ),
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[1],
        top: screenHeight * 0.08,
        right: screenWidth * -0.00,
        width: screenWidth * 0.40,
        height: screenHeight * 0.40,
      ),
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[2],
        top: screenHeight * 0.44,
        left: screenWidth * -0.08,
        width: screenWidth * 0.375,
        height: screenHeight * 0.1875,
      ),
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[3],
        top: screenHeight * 0.44,
        right: screenWidth * -0.12,
        width: screenWidth * 0.4,
        height: screenHeight * 0.2,
      ),
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[4],
        bottom: screenHeight * 0.09,
        left: screenWidth * -0.00,
        width: screenWidth * 0.40,
        height: screenHeight * 0.40,
      ),
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[5],
        bottom: screenHeight * 0.01,
        right: screenWidth * -0.06,
        width: screenWidth * 0.45,
        height: screenHeight * 0.45,
      ),
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[6],
        bottom: screenHeight * -0.01875,
        left: screenWidth * -0.09,
        width: screenWidth * 0.325,
        height: screenHeight * 0.1625,
      ),
      _buildPositionedFlowerImage(
        imagePath: AppImages.smellImages[7],
        bottom: screenHeight * -0.0175,
        right: screenWidth * -0.09,
        width: screenWidth * 0.35,
        height: screenHeight * 0.175,
      ),
    ];
  }

  /// Builds a positioned flower image widget.
  Widget _buildPositionedFlowerImage({
    required String imagePath,
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double width,
    required double height,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
      ),
    );
  }

  /// Builds the main content column with text and navigation buttons.
  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 7),
        _buildCenterText(),
        const Spacer(flex: 5),
        _buildNavigationButtons(context),
        const Spacer(),
      ],
    );
  }

  /// Builds the center text content with smell instructions.
  Widget _buildCenterText() {
    return Center(
      child: Column(
        children: [
          Text(
            'Imagine the smell of\nLavender',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3.copyWith(
              letterSpacing: 1.3,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: AppSizes.smallPadding),
          Text(
            'Or smell any available scent',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyTextSecondary.copyWith(
              letterSpacing: 1.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the navigation buttons section.
  Widget _buildNavigationButtons(BuildContext context) {
    return Column(
      children: [
        AppElevatedButton(
          text: 'Next',
          widthRatio: AppSizes.buttonWidthRatio,
          onPressed: () => _navigateToBubbleGame(context),
        ),
        AppTextButton(
          text: 'Finish Session',
          onPressed: () => _navigateToFinishScreen(context),
        ),
      ],
    );
  }

  /// Navigates to the bubble pop game screen.
  void _navigateToBubbleGame(BuildContext context) {
    NavigationUtils.navigateToScreen(
      context,
      BubblePopGameScreen(startTime: startTime),
    );
  }

  /// Navigates to the finish screen.
  void _navigateToFinishScreen(BuildContext context) {
    NavigationUtils.navigateToScreen(
      context,
      FinishScreen(startTime: startTime),
    );
  }
}
