
// modify the code to make the vibration stop when the user presses the pause button
import 'package:calmattack/Pages/FinishScreen.dart';
import 'package:calmattack/Pages/TasteScreen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';

class VibrationScreen extends StatefulWidget {
  const VibrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VibrationScreenState createState() => _VibrationScreenState();
}

class _VibrationScreenState extends State<VibrationScreen> {
  bool _vibrating = false;

  @override
  void initState() {
    super.initState();
    startVibration();
  }

  void startVibration() async {
    setState(() {
      _vibrating = true;
    });
    while (_vibrating) {
      Vibration.vibrate(pattern: [500, 500]);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void stopVibration() {
    setState(() {
      _vibrating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Focus on',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'The Vibration',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            //--------------------------------------------------------------
            Container(
              width: 300,
              height: 300,
              child: const RiveAnimation.asset(
                'assets/vibrationAni.riv',
              ),
            ),
            const SizedBox(height: 35),
            //-------------------------------------------------------ICON button-------
            IconButton(
              onPressed: _vibrating ? stopVibration : startVibration,
              icon: _vibrating
                  ? const Icon(Icons.pause, size: 50, color: Colors.red)
                  : const Icon(Icons.play_arrow_rounded,
                      size: 50, color: Colors.red),
            ),
            //--------------------------------------------------------------
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TasteScreen()));
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: const Color(0xff0F073E),
                  elevation: 9,
                ),
                child: const Text('      Next      ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ), 
            ),
            TextButton(
              onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FinishScreen()));
          },
               child: const Text('Finish Session')),
          ],
        ),
      ),
    );
  }
}
