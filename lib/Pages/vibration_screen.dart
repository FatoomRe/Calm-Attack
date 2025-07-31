// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'package:calmattack/Pages/finish_screen.dart';
import 'package:calmattack/Pages/taste_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';

class VibrationScreen extends StatefulWidget {
  final DateTime startTime;
  const VibrationScreen({super.key, required this.startTime});

  @override
  _VibrationScreenState createState() => _VibrationScreenState();
}

class _VibrationScreenState extends State<VibrationScreen> {
  bool _vibrating = false; // Tracks whether vibration is active
  late RiveAnimationController _riveController; // Controller for Rive animation

  @override
  void initState() {
    super.initState();
    _riveController = SimpleAnimation('wave'); // Initialize Rive animation controller
    startVibration(); // Start vibration when the screen initializes
  }

  // Function to start vibration in a loop with a specific pattern
  void startVibration() async {
    setState(() {
      _vibrating = true;
      _riveController.isActive = true; // Activate the Rive animation
    });

    // Loop to keep vibrating as long as _vibrating is true
    while (_vibrating) {
      if (await Vibration.hasCustomVibrationsSupport() ?? false) {
        Vibration.vibrate(pattern: [500, 500]); // Vibrate for 500ms and pause for 500ms
      } else {
        Vibration.vibrate(duration: 500); // Fallback for devices without custom vibration support
      }
      await Future.delayed(const Duration(seconds: 3)); // Delay for 3 seconds
    }
  }

  // Function to stop the vibration and animation
  void stopVibration() {
    setState(() {
      _vibrating = false;
      _riveController.isActive = false; // Deactivate the Rive animation
    });
    Vibration.cancel(); // Cancel any ongoing vibration
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Adjust alignment
              children: [
                const SizedBox(height: 55), // Add extra space at the top
                const Text(
                  'Focus on',
                  style: TextStyle(
                    color: Color(0xff0F073E),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'The Vibration',
                  style: TextStyle(
                    color: Color(0xff0F073E),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: RiveAnimation.asset(
                    'assets/vibrationAni.riv',
                    controllers: [_riveController], // Attach the controller
                  ),
                ),
                const SizedBox(height: 20),
                // Button to start/stop vibration and animation
                IconButton(
                  onPressed: _vibrating ? stopVibration : startVibration,
                  icon: Icon(
                    _vibrating ? Icons.pause : Icons.play_arrow_rounded,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 36),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      stopVibration();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TasteScreen(startTime: widget.startTime),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0F073E),
                      elevation: 9,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    stopVibration();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FinishScreen(startTime: widget.startTime),
                      ),
                    );
                  },
                  child: const Text('Finish Session'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    stopVibration(); // Ensure vibration and animation stop when the screen is disposed
    super.dispose();
  }
}