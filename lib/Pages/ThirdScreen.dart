// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xff3E3BD4), Color(0xff1AAC9B)],
      stops: [0.1, 0.40],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


    return Scaffold(
      backgroundColor: Colors.white, // Set the background color here
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 75),
            const Text(
              'Focus on',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShaderMask(
                shaderCallback: (bounds) => linearGradient,
              child: const Text(
                'Waves',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
