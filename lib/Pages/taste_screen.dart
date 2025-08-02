/// Taste screen for the Calm Attack application.
///
/// This screen guides users through a taste-based grounding exercise
/// to help shift their focus and achieve a calmer mental state.
/// Features food imagery and taste visualization prompts.

import 'package:flutter/material.dart';

import 'finish_screen.dart';
import 'smell_screen.dart';
import '../core/constants/app_constants.dart';
import '../core/widgets/common_widgets.dart';
import '../core/utils/navigation_utils.dart';

/// The taste screen widget providing taste-based grounding exercise.
///
/// This screen displays:
/// - Decorative food images positioned around the screen
/// - Central taste prompt for lemon ice cream
/// - Alternative instruction text
/// - Navigation buttons for Next/Finish
class TasteScreen extends StatelessWidget {
  /// The start time of the current session for tracking purposes
  final DateTime startTime;

  const TasteScreen({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              ..._buildFoodImages(screenWidth, screenHeight),
              _buildMainContent(context, screenWidth, screenHeight),
            ],
          );
        },
      ),
    );
  }

  /// Builds all the decorative food images positioned around the screen.
  List<Widget> _buildFoodImages(double screenWidth, double screenHeight) {
    return [
      _buildPositionedFoodImage(
        imagePath: AppImages.doughnut,
        top: screenHeight * -0.005,
        right: screenWidth * -0.05,
        width: screenWidth * 0.40,
        height: screenWidth * 0.40,
      ),
      _buildPositionedFoodImage(
        imagePath: AppImages.pancake,
        top: screenHeight * 0.1,
        left: screenWidth * -0.05,
        width: screenWidth * 0.40,
        height: screenWidth * 0.40,
      ),
      _buildPositionedFoodImage(
        imagePath: AppImages.cupcake,
        top: screenHeight * 0.25,
        right: screenWidth * -0.1,
        width: screenWidth * 0.50,
        height: screenWidth * 0.50,
      ),
      _buildPositionedFoodImage(
        imagePath: AppImages.milkshake,
        bottom: screenHeight * 0.2,
        left: screenWidth * -0.09,
        width: screenWidth * 0.50,
        height: screenWidth * 0.50,
      ),
      _buildPositionedFoodImage(
        imagePath: AppImages.icecream,
        bottom: screenHeight * 0.1,
        right: screenWidth * -0.15,
        width: screenWidth * 0.60,
        height: screenWidth * 0.60,
      ),
      _buildPositionedFoodImage(
        imagePath: AppImages.pineapple,
        bottom: screenHeight * 0.00,
        left: screenWidth * -0.05,
        width: screenWidth * 0.40,
        height: screenWidth * 0.40,
      ),
    ];
  }

  /// Builds a positioned food image widget.
  Widget _buildPositionedFoodImage({
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
  Widget _buildMainContent(
      BuildContext context, double screenWidth, double screenHeight) {
    return Column(
      children: [
        const Spacer(flex: 7),
        _buildCenterText(),
        const Spacer(flex: 5),
        _buildNavigationButtons(context, screenWidth),
        const Spacer(),
      ],
    );
  }

  /// Builds the center text content with taste instructions.
  Widget _buildCenterText() {
    return Center(
      child: Column(
        children: [
          Text(
            'Imagine the taste of\nLemon Ice Cream',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3.copyWith(
              letterSpacing: 1.3,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: AppSizes.smallPadding),
          Text(
            'Or find something you can taste',
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
  Widget _buildNavigationButtons(BuildContext context, double screenWidth) {
    return Column(
      children: [
        AppElevatedButton(
          text: 'Next',
          widthRatio: AppSizes.buttonWidthRatio,
          onPressed: () => _navigateToSmellScreen(context),
        ),
        AppTextButton(
          text: 'Finish Session',
          onPressed: () => _navigateToFinishScreen(context),
        ),
      ],
    );
  }

  /// Navigates to the smell screen.
  void _navigateToSmellScreen(BuildContext context) {
    NavigationUtils.navigateToScreen(
      context,
      SmellScreen(startTime: startTime),
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
