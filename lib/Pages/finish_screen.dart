// ignore_for_file: sized_box_for_whitespace

import 'package:calmattack/Pages/start_screen.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  final DateTime startTime; // Stores the start time of the activity.
  const FinishScreen({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {

    final endTime = DateTime.now(); // Captures the current time as the end time.
    final timeSpent = endTime.difference(startTime); // Calculates the duration spent on the activity.
    final minutesSpent = timeSpent.inMinutes; // Converts the duration to minutes.

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenSize = constraints.biggest;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff052D94),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'You survived your panic attack, you are\nin control of your mind and body.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Image.asset(
                    'assets/cong.png',
                    width: screenSize.width * 0.75,
                    height: screenSize.width * 0.75, // Maintain square aspect ratio
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Total Spent Time',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$minutesSpent Minute',
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff052D94),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 50,
                    width: screenSize.width * 0.53,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff052D94),
                        elevation: 9,
                      ),
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}