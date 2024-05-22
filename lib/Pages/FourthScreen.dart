import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Screen'),
      ),
      body: const Center(
              child: RiveAnimation.asset(
        'assets/vibrationAni.riv',
      )),
    );
  }
}
