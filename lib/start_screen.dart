import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/img1.png',
            width: 320,
          ),
          TextButton(
            onPressed: () { //<-- thie call annonimous function
              //... here we can add the code to navigate to the next screen
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
