// ignore_for_file: file_names, deprecated_member_use

import 'package:calmattack/Pages/BreathingScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            textAlign: TextAlign.center,
            'Are you having a Panic Attack?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 43,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
              height:
                  20), //<-- add this line to add some space between the top and the image
          Transform.rotate(
            angle: -17.8 * pi / 180, //<-- rotate the image
            child: Image.asset(
              'assets/SSAttack.png',
              width: 320,
            ),
          ),
          const SizedBox(
              height:
                  80), //<-- add this line to add some space between the image and the text
          // ignore: sized_box_for_whitespace
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BreathingScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0F073E),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
