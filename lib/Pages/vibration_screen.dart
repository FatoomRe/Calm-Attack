import 'package:calmattack/Pages/finish_screen.dart';
import 'package:calmattack/Pages/taste_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';

class VibrationScreen extends StatefulWidget {
  const VibrationScreen({Key? key}) : super(key: key);

  @override
  _VibrationScreenState createState() => _VibrationScreenState();
}

class _VibrationScreenState extends State<VibrationScreen> {

  bool _vibrating = false; // Tracks whether vibration is active

  @override
  void initState() {
    super.initState();
    startVibration(); // Start vibration when the screen initializes
  }

  // Function to start vibration in a loop with a specific pattern
  void startVibration() async {
    setState(() {
      _vibrating = true;
    });
    // Loop to keep vibrating as long as _vibrating is true
    while (_vibrating) {
      Vibration.vibrate(pattern: [500, 500]); // Vibrate for 500ms and pause for 500ms
      await Future.delayed(const Duration(seconds: 1)); // Delay for 1 second
    }
  }

  // Function to stop the vibration.
  void stopVibration() {
    setState(() {
      _vibrating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                const SizedBox(
                  width: 300,
                  height: 300,
                  child: RiveAnimation.asset('assets/vibrationAni.riv'),
                ),
                const SizedBox(height: 10),
                // Button to start/stop vibration
                IconButton(
                  onPressed: _vibrating ? stopVibration : startVibration,
                  icon: Icon(
                    _vibrating ? Icons.pause : Icons.play_arrow_rounded,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 9),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      stopVibration();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TasteScreen(),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FinishScreen(),
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
}