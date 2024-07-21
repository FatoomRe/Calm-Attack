import 'package:calmattack/Animations/breathing_cloud.dart';
import 'package:calmattack/Pages/audio_screen.dart';
import 'package:calmattack/Pages/finish_screen.dart';
import 'package:flutter/material.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  // Variable to hold the current breathing phase text.
  String _breathingText = 'INHALE';

  // Function to update the breathing text.
  void _updateBreathingText(String text) {
    setState(() {
      _breathingText = text; // Updating the breathing text with the new value.
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const BreathingPhases(), // Widget to display the breathing phases.
            const SizedBox(height: 10),
            Text(
              _breathingText, // Displaying the current breathing phase text.
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenSize.height * 0.2),
            // Custom animation widget with callback to update text.
            BreathingCloud(callback: _updateBreathingText),
            SizedBox(height: screenSize.height * 0.3),
            // Widget to display navigation buttons.
            const NavigationButtons(),
          ],
        ),
      ),
    );
  }
}

// Stateless widget to display each breathing phase
class BreathingPhases extends StatelessWidget {
  const BreathingPhases({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
        child: const Row(
          children: [
            Expanded(
              child: BreathingPhaseWidget(
                duration: '3',
                phase: 'INHALE',
              ),
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 2.5,
              indent: 26,
              endIndent: 15,
            ),
            Expanded(
              child: BreathingPhaseWidget(
                duration: '3',
                phase: 'HOLD',
              ),
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 2.5,
              indent: 26,
              endIndent: 15,
            ),
            Expanded(
              child: BreathingPhaseWidget(
                duration: '3',
                phase: 'EXHALE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateless widget to display each breathing phase.
class BreathingPhaseWidget extends StatelessWidget {
  final String duration;
  final String phase;

  const BreathingPhaseWidget({
    super.key,
    required this.duration,
    required this.phase,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          duration,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Seconds',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        Text(
          phase,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// Stateless widget to display navigation buttons.
class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.45, // Responsive width
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AudioScreen()),
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
              MaterialPageRoute(builder: (context) => const FinishScreen()),
            );
          },
          child: const Text('Finish Session'),
        ),
      ],
    );
  }
}
