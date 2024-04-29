import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 100), //<-- add this line to add some space between the top and the image
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
