/// Common widgets used throughout the Calm Attack application.
///
/// This file contains reusable UI components that maintain consistency
/// across different screens and reduce code duplication.

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// A standardized elevated button used throughout the app.
///
/// This widget provides consistent styling for primary action buttons
/// and reduces code duplication across different screens.
class AppElevatedButton extends StatelessWidget {
  /// Text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback onPressed;

  /// Button width as a ratio of screen width (optional)
  final double? widthRatio;

  /// Custom text style (optional, defaults to buttonLarge)
  final TextStyle? textStyle;

  /// Custom background color (optional, defaults to primaryDark)
  final Color? backgroundColor;

  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.widthRatio,
    this.textStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: AppSizes.buttonHeight,
      width: widthRatio != null ? screenWidth * widthRatio! : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryDark,
          elevation: AppSizes.buttonElevation,
        ),
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.buttonLarge,
        ),
      ),
    );
  }
}

/// A standardized text button for secondary actions.
///
/// Used for actions like "Finish Session" throughout the app.
class AppTextButton extends StatelessWidget {
  /// Text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback onPressed;

  /// Custom text style (optional)
  final TextStyle? textStyle;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

/// A reusable gradient background container.
///
/// Provides the standard app gradient used in multiple screens.
class GradientBackground extends StatelessWidget {
  /// Child widget to display over the gradient
  final Widget child;

  /// Custom gradient colors (optional)
  final List<Color>? colors;

  /// Custom gradient stops (optional)
  final List<double>? stops;

  const GradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ?? [AppColors.gradientStart, AppColors.gradientEnd],
          stops: stops ?? [0.3, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}

/// A navigation widget that provides consistent Next/Finish buttons.
///
/// This widget standardizes the navigation pattern used throughout the app.
class NavigationSection extends StatelessWidget {
  /// The start time of the current session
  final DateTime startTime;

  /// The next screen to navigate to when "Next" is pressed
  final Widget? nextScreen;

  /// Custom width ratio for the Next button (optional)
  final double? buttonWidthRatio;

  /// Whether to show the Finish Session button (defaults to true)
  final bool showFinishButton;

  const NavigationSection({
    super.key,
    required this.startTime,
    this.nextScreen,
    this.buttonWidthRatio,
    this.showFinishButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (nextScreen != null)
          AppElevatedButton(
            text: 'Next',
            widthRatio: buttonWidthRatio ?? AppSizes.buttonWidthRatio,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextScreen!),
              );
            },
          ),
        if (showFinishButton)
          AppTextButton(
            text: 'Finish Session',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _getFinishScreen(startTime),
                ),
              );
            },
          ),
      ],
    );
  }

  /// Helper method to create finish screen with proper import
  Widget _getFinishScreen(DateTime startTime) {
    // This will be imported dynamically to avoid circular dependencies
    // For now, we'll return a placeholder and fix this in the actual implementation
    return Container(); // This will be replaced with actual FinishScreen
  }
}

/// A standardized app bar for consistent navigation.
///
/// Provides a consistent look and feel across different screens.
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  /// Title text for the app bar
  final String title;

  /// Whether to show the back button (defaults to true)
  final bool showBackButton;

  /// Custom background color (optional)
  final Color? backgroundColor;

  const AppBarWidget({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.heading2.copyWith(
          color: AppColors.textOnPrimary,
        ),
      ),
      backgroundColor: backgroundColor ?? AppColors.primaryDark,
      automaticallyImplyLeading: showBackButton,
      elevation: AppSizes.buttonElevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// A reusable screen header with title and optional subtitle.
///
/// Provides consistent header styling across different screens.
class ScreenHeader extends StatelessWidget {
  /// Main title text
  final String title;

  /// Optional subtitle text
  final String? subtitle;

  /// Custom title style (optional)
  final TextStyle? titleStyle;

  /// Custom subtitle style (optional)
  final TextStyle? subtitleStyle;

  /// Text alignment (defaults to center)
  final TextAlign textAlign;

  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            title,
            style: titleStyle ?? AppTextStyles.heading2,
            textAlign: textAlign,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppSizes.spacingSmall),
          Flexible(
            child: Text(
              subtitle!,
              style: subtitleStyle ?? AppTextStyles.bodyMedium,
              textAlign: textAlign,
            ),
          ),
        ],
      ],
    );
  }
}

/// A loading indicator with consistent styling.
///
/// Used for showing loading states throughout the app.
class AppLoadingIndicator extends StatelessWidget {
  /// Optional loading message
  final String? message;

  /// Custom color for the indicator (optional)
  final Color? color;

  const AppLoadingIndicator({
    super.key,
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: color ?? AppColors.primaryDark,
          ),
          if (message != null) ...[
            const SizedBox(height: AppSizes.spacingMedium),
            Text(
              message!,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
