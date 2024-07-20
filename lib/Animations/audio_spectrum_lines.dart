import 'dart:math';

import 'package:flutter/material.dart';
class AudioSpectrumLines extends StatefulWidget {
  const AudioSpectrumLines({super.key});

  @override
  State<AudioSpectrumLines> createState() => _AudioSpectrumLinesState();
}

class _AudioSpectrumLinesState extends State<AudioSpectrumLines>
    with TickerProviderStateMixin {
  // List to hold the animation controllers for each line.
  late List<AnimationController> controllers;
  // List to hold the animations for the height of each line.
  late List<Animation<double>> animations;
  // The number of lines in the spectrum.
  final count = 6;
  // Random number generator for animation variations.
  final random = Random();

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with random durations and set them to repeat.
    controllers = List.generate(count, (index) {
      final durationMilliseconds = 20 + random.nextInt(700);
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationMilliseconds),
      )..repeat(reverse: true);
    });

    // Initialize the animations for each line with random heights.
    animations = controllers.map((controller) {
      final beginHeight = 15.0 + random.nextDouble() * 25;
      final endHeight = 40.0 + random.nextDouble() * 50;
      return Tween<double>(begin: beginHeight, end: endHeight).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Build a row of animated lines.
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        return AnimatedBuilder(
          animation: controllers[index],
          builder: (BuildContext context, Widget? child) {
            return Container(
              // Margin to separate lines, except for the last one.
              margin: index == (count - 1)
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(right: 11),
              // Animated height based on the current animation value.
              height: animations[index].value,
              width: 16,
              decoration: BoxDecoration(
                color: const Color(0xff0F073E),
                // Rounded corners for the line.
                borderRadius: BorderRadius.circular(9999),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree.
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
