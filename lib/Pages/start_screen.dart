// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:calmattack/Pages/breathing_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // Setting a linear gradient background for the container
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // Gradient colors from dark blue to teal.
            colors: [Color.fromARGB(255, 38, 59, 173), Color(0xff00c4b2)],
            // Gradient stops, indicating where each color should reach its full intensity.
            stops: [0.3, 1], // stops should ideally sum up to 1
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Are you having a\nPanic Attack?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 43,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Transform.rotate(
                angle: -17.8 * pi / 180, // Rotating the image by -17.8 degrees.
                child: Image.asset(
                  'assets/SSAttack.png',
                  width: screenSize.width * 0.8, // Responsive width
                ),
              ),
              const SizedBox(height: 90),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                      final startTime = DateTime.now(); // to Capture the start time
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BreathingScreen(startTime: startTime), // Passing the start time to the next screen
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0F073E),
                    elevation: 9,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}