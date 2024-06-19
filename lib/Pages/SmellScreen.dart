import 'package:flutter/material.dart';

class SmellScreen extends StatelessWidget {
  const SmellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 40, left: -60, child: Image.asset('assets/Smell/F1.png', width: 250, height: 250)),
          Positioned(top: 40, right: -53, child: Image.asset('assets/Smell/F2.png', width: 250, height: 250)),
          Positioned(top: 250, left: -29, child: Image.asset('assets/Smell/F3.png', width: 180, height: 180)),
          Positioned(top: 250, right: -50, child: Image.asset('assets/Smell/F4.png', width: 180, height: 180)),
          Positioned(bottom: 90, left: -40, child: Image.asset('assets/Smell/F5.png', width: 230, height: 230)),
          Positioned(bottom:35, right: -84, child: Image.asset('assets/Smell/F6.png', width: 300, height:300)),
          Positioned(bottom: 0, left: -20, child: Image.asset('assets/Smell/F7.png', width: 120, height: 120)),
          Positioned(bottom: -7, right: -24, child: Image.asset('assets/Smell/F8.png', width: 140, height: 140)),
        ],
      ),
    );
  }
}