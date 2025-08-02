/// Vibration screen for the Calm Attack application.
///
/// This screen provides a tactile grounding exercise using device vibration
/// combined with visual animation to help users focus their attention
/// and achieve a calmer mental state.

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';

import 'finish_screen.dart';
import 'taste_screen.dart';
import '../core/constants/app_constants.dart';
import '../core/widgets/common_widgets.dart';
import '../core/utils/navigation_utils.dart';

/// The vibration screen widget providing tactile grounding exercise.
///
/// This screen displays:
/// - Instructional header text
/// - Animated Rive animation synchronized with vibration
/// - Play/pause control for vibration
/// - Navigation buttons for Next/Finish
class VibrationScreen extends StatefulWidget {
  /// The start time of the current session for tracking purposes
  final DateTime startTime;

  const VibrationScreen({super.key, required this.startTime});

  @override
  State<VibrationScreen> createState() => _VibrationScreenState();
}

class _VibrationScreenState extends State<VibrationScreen> {
  /// Tracks whether vibration is currently active
  bool _isVibrating = false;

  /// Controller for the Rive animation
  late RiveAnimationController _riveController;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _startVibration();
  }

  @override
  void dispose() {
    // Cancel vibration and cleanup without setState
    _isVibrating = false;
    _riveController.isActive = false;
    Vibration.cancel();
    super.dispose();
  }

  /// Initializes the Rive animation controller.
  void _initializeAnimation() {
    _riveController = SimpleAnimation('wave');
  }

  /// Starts the vibration pattern and animation.
  void _startVibration() async {
    if (!mounted) return;

    setState(() {
      _isVibrating = true;
      _riveController.isActive = true;
    });

    await _vibrationLoop();
  }

  /// Runs the vibration loop while vibration is enabled.
  Future<void> _vibrationLoop() async {
    while (_isVibrating && mounted) {
      try {
        final hasCustomSupport = await Vibration.hasCustomVibrationsSupport();
        if (hasCustomSupport == true) {
          Vibration.vibrate(pattern: [500, 500]);
        } else {
          Vibration.vibrate(duration: 500);
        }
        await Future.delayed(const Duration(seconds: 3));
      } catch (e) {
        // Handle vibration errors gracefully
        break;
      }
    }
  }

  /// Stops the vibration and animation.
  void _stopVibration() {
    if (!mounted) return;

    setState(() {
      _isVibrating = false;
      _riveController.isActive = false;
    });
    Vibration.cancel();
  }

  /// Toggles vibration on/off.
  void _toggleVibration() {
    if (_isVibrating) {
      _stopVibration();
    } else {
      _startVibration();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.mediumPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                _buildHeader(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                _buildVibrationAnimation(),
                const SizedBox(height: AppSizes.mediumPadding),
                _buildPlayPauseButton(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                _buildNavigationButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the header text section.
  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Focus on',
          style: AppTextStyles.heading3,
          textAlign: TextAlign.center,
        ),
        Text(
          'The Vibration',
          style: AppTextStyles.heading3,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Builds the vibration animation container.
  Widget _buildVibrationAnimation() {
    return SizedBox(
      width: 300,
      height: 300,
      child: RiveAnimation.asset(
        'assets/vibrationAni.riv',
        controllers: [_riveController],
      ),
    );
  }

  /// Builds the play/pause button for vibration control.
  Widget _buildPlayPauseButton() {
    return IconButton(
      onPressed: _toggleVibration,
      icon: Icon(
        _isVibrating ? Icons.pause : Icons.play_arrow_rounded,
        size: 50,
        color: AppColors.accentBlue,
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
          onPressed: () => _navigateToTasteScreen(),
        ),
        AppTextButton(
          text: 'Finish Session',
          onPressed: () => _navigateToFinishScreen(),
        ),
      ],
    );
  }

  /// Navigates to the taste screen.
  void _navigateToTasteScreen() {
    _stopVibration();
    NavigationUtils.navigateToScreen(
      context,
      TasteScreen(startTime: widget.startTime),
    );
  }

  /// Navigates to the finish screen.
  void _navigateToFinishScreen() {
    _stopVibration();
    NavigationUtils.navigateToScreen(
      context,
      FinishScreen(startTime: widget.startTime),
    );
  }
}
