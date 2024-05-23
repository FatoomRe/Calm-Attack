
// modify the code to make the vibration stop when the user presses the pause button
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
            const SizedBox(height: 40),
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
            const SizedBox(height: 20),
            //--------------------------------------------------------------
            Container(
              width: 300,
              height: 300,
              child: const RiveAnimation.asset(
                'assets/vibrationAni.riv',
              ),
            ),
            const SizedBox(height: 10),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color(0xff0F073E),
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
            TextButton(onPressed: () {}, child: const Text('Finish Session')),
          ],
        ),
      ),
    );
  }
}
