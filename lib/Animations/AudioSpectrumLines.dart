// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';

class AudioSpectrumLines extends StatefulWidget {
  const AudioSpectrumLines({super.key});

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

    controllers = List.generate(count, (index) {
  final durationMilliseconds = 20 + random.nextInt(700);
  return AnimationController(
  vsync: this,
  duration: Duration(milliseconds: durationMilliseconds),
)..repeat(reverse: true);
});

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
              height: animations[index]
                  .value, // Use the animation value as the height
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
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
