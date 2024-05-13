import 'package:calmattack/Animations/AudioSpectrumLines.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: AudioSpectrumLines(),
      ),
    );
  }
}