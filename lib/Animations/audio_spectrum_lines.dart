import 'dart:math';
import 'package:flutter/material.dart';

class AudioSpectrumLines extends StatefulWidget {
  final bool isPlaying; // Add a boolean to control the animation state

  const AudioSpectrumLines({super.key, required this.isPlaying});

  @override
  State<AudioSpectrumLines> createState() => _AudioSpectrumLinesState();
}

class _AudioSpectrumLinesState extends State<AudioSpectrumLines>
    with TickerProviderStateMixin {
  late List<AnimationController> controllers;
  late List<Animation<double>> animations;
  final count = 6;
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
  void didUpdateWidget(AudioSpectrumLines oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Pause or resume animations based on the `isPlaying` property.
    if (!widget.isPlaying) {
      for (var controller in controllers) {
        controller.stop(); // Stop the animations
      }
    } else {
      for (var controller in controllers) {
        controller.repeat(reverse: true); // Resume the animations
      }
    }
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
              margin: index == (count - 1)
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(right: 11),
              height: animations[index].value,
              width: 16,
              decoration: BoxDecoration(
                color: const Color(0xff0F073E),
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