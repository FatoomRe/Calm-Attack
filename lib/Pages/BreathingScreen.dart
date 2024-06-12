// ignore_for_file: file_names

import 'package:calmattack/Animations/BreathingCloud.dart';
import 'package:calmattack/Pages/AudioScreen.dart';
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
  Widget build(context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 30),
        IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    //color: Colors.red,
                    height: 100,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seconds',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'INHALE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2.5,
                  indent: 26,
                  endIndent: 15,
                ),
                Expanded(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    //color: Colors.green,
                    height: 100,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seconds',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'HOLD',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2.5,
                  indent: 26,
                  endIndent: 15,
                ),
                Expanded(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    //color: Colors.blue,
                    height: 100,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seconds',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'EXHALE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
         Text(
          _breathingText,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 160),
        BreathingCloud(callback: _updateBreathingText), //--> animation image
        const SizedBox(height: 170),
        Column(
          children: [
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AudioScreen()));
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color(0xff0F073E),
                ),
                child: const Text('      Next      ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text('Finish Session')),
      ],
    ));
  }
}
