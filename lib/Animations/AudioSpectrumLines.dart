import 'package:flutter/material.dart';

import 'dart:math' as math;


class AudioSpectrumLines extends StatefulWidget {
  const AudioSpectrumLines({Key? key}) : super(key: key);

  @override
  State<AudioSpectrumLines> createState() => _AudioSpectrumLinesState();
}

class _AudioSpectrumLinesState extends State<AudioSpectrumLines>
 with TickerProviderStateMixin {
  
  late AnimationController controller;

  @override
  void initState() {
  super.initState();
  controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10), 
  )..repeat();
}
  @override
Widget build(BuildContext context) {
  const count = 7;
  final random = math.Random();

  return AnimatedBuilder(
    animation: controller,
    builder: (BuildContext context, Widget? child) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(count, (index) {
          final height = 30.0 + random.nextDouble() * 55;

          return Container(
            margin: index == (count - 1)
                ? EdgeInsets.zero
                : const EdgeInsets.only(right: 5),
            height: height, 
            width: 20,
            decoration: BoxDecoration(
              color: const Color(0xff0F073E),
              borderRadius: BorderRadius.circular(9999),
            ),
          );
        }),
      );
    },
  );
}}