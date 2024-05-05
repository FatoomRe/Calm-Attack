// ignore_for_file: file_names

import 'package:calmattack/Pages/ThirdScreen.dart';
import 'package:flutter/material.dart';

class BreathingScreen extends StatelessWidget {
  const BreathingScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'INHALE',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/c1 1.png',
              width: 200,
            ),
            const SizedBox(
              height: 140,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThirdScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff0F073E),
              ),
              child: const Text(
                '       Next       ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ));
  }
}
