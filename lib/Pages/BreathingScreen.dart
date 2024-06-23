// ignore: file_names
import 'package:calmattack/Animations/BreathingCloud.dart';
import 'package:calmattack/Pages/AudioScreen.dart';
import 'package:calmattack/Pages/FinishScreen.dart';
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
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 30),
        const BreathingPhases(),
        const SizedBox(height: 10),
        Text(
          _breathingText,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 160),
        BreathingCloud(callback: _updateBreathingText),
        const SizedBox(height: 170),
        const NavigationButtons(),
      ],
    ));
  }
}

class BreathingPhases extends StatelessWidget {
  const BreathingPhases({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(30),
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
    return Container(
      height: 100,
      child: Column(
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
      ),
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
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AudioScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0F073E),
            ),
            child: const Text(
              '      Next      ',
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