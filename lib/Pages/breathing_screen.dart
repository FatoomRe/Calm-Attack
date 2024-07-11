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
  String _breathingText = 'INHALE';

  void _updateBreathingText(String text) {
    setState(() {
      _breathingText = text;
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
            const BreathingPhases(),
            const SizedBox(height: 10),
            Text(
              _breathingText,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenSize.height * 0.2),
            BreathingCloud(callback: _updateBreathingText),
            SizedBox(height: screenSize.height * 0.3),
            const NavigationButtons(),
          ],
        ),
      ),
    );
  }
}

class BreathingPhases extends StatelessWidget {
  const BreathingPhases({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08), // Responsive padding
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