import 'package:flutter/material.dart';
import 'dart:async';

class BreathingCloud extends StatefulWidget {
  final Function(String) callback;

  const BreathingCloud({super.key, required this.callback});

  @override

  // ignore: library_private_types_in_public_api
  _BreathingCloudState createState() => _BreathingCloudState();
}

class _BreathingCloudState extends State<BreathingCloud>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation; // Animation for the image size.
  String _imagePath = 'assets/INHALE.png';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define the animation to tween between 50.0 and 100.0.
    _animation = Tween(begin: 50.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Add a listener to the animation status.
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // When animation completes, change the image and callback with "HOLD".
        setState(() {
          _imagePath = 'assets/HOLD.png';
          widget.callback('HOLD');
        });
        // After a delay, change the image to "EXHALE" and reverse the animation.
        Timer(const Duration(seconds: 3), () {
          setState(() {
            _imagePath = 'assets/EXHALE.png';
            widget.callback('EXHALE');
          });
          _controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        // When animation is dismissed, reset the image to "INHALE".
        setState(() {
          _imagePath = 'assets/INHALE.png';
          widget.callback('INHALE');
        });
        _controller.forward();
      }
    });

    // Start the animation.
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // Use AnimatedBuilder to rebuild the widget with the current animation value.
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          // Scale the image based on the animation value.
          scale: _animation.value,
          child: Container(
            // Set the width based on the animation value.
            width: _animation.value,
            child: Image.asset(_imagePath, width: 2.0, height: 2.0),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the widget tree.
    _controller.dispose();
    super.dispose();
  }
}
