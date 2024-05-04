
// ignore_for_file: file_names, deprecated_member_use

import 'package:calmattack/Pages/ThirdScreen.dart';
import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff0F073E),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder:(context) => const ThirdScreen()));
          },
        )),
    );
  }
}
