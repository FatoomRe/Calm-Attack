/// Breathing animation component for the Calm Attack application.
///
/// This widget provides a visual breathing guide that cycles through
/// inhale, hold, and exhale phases with corresponding images and timing.

import 'package:flutter/material.dart';
import 'dart:async';
import '../core/constants/app_constants.dart';

/// An animated breathing guide widget.
///
/// This widget displays breathing images that change based on the current
/// phase (inhale, hold, exhale) and provides visual feedback through
/// scaling animations synchronized with breathing timing.
class BreathingCloud extends StatefulWidget {
  /// Callback function to notify parent widget of phase changes
  final Function(String) callback;

  const BreathingCloud({super.key, required this.callback});

  @override
  State<BreathingCloud> createState() => _BreathingCloudState();
}

class _BreathingCloudState extends State<BreathingCloud>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  /// Current breathing phase image path
  String _imagePath = AppImages.inhaleImage;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _startBreathingCycle();
  }

  /// Initializes the animation controller and animation curve.
  void _initializeAnimation() {
    _controller = AnimationController(
      duration: AppDurations.breathingCycle,
      vsync: this,
    );

    // Define smooth scaling animation for breathing effect
    _animation = Tween(begin: 50.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Listen for animation status changes to manage breathing phases
    _controller.addStatusListener(_handleAnimationStatus);
  }

  /// Handles animation status changes for breathing phase transitions.
  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _transitionToHoldPhase();
    } else if (status == AnimationStatus.dismissed) {
      _transitionToInhalePhase();
    }
  }

  /// Transitions to the hold phase after inhaling.
  void _transitionToHoldPhase() {
    setState(() {
      _imagePath = AppImages.holdImage;
      widget.callback(BreathingConstants.holdPhase);
    });

    // Hold for specified duration before exhaling
    Timer(AppDurations.holdPhase, () {
      if (mounted) {
        setState(() {
          _imagePath = AppImages.exhaleImage;
          widget.callback(BreathingConstants.exhalePhase);
        });
        _controller.reverse();
      }
    });
  }

  /// Transitions back to the inhale phase to restart the cycle.
  void _transitionToInhalePhase() {
    setState(() {
      _imagePath = AppImages.inhaleImage;
      widget.callback(BreathingConstants.inhalePhase);
    });
    _controller.forward();
  }

  /// Starts the initial breathing cycle.
  void _startBreathingCycle() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: SizedBox(
            width: _animation.value,
            child: Image.asset(
              _imagePath,
              width: 2.0,
              height: 2.0,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
