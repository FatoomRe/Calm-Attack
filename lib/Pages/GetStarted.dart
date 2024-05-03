import 'package:flutter/material.dart';

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
            'Are you having a panic attack?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 43,
            ),
          ),
          const SizedBox(height: 20), //<-- add this line to add some space between the top and the image
          Image.asset(
            'assets/img1.png',
            width: 320,
          ),
          const SizedBox(height: 80), //<-- add this line to add some space between the image and the text
          ElevatedButton(
            onPressed: () { //<-- thie call annonimous function
              //... here we can add the code to navigate to the next screen
            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                color: Color.fromARGB(255, 5, 0, 0),
                fontSize: 20,
              ),
          ),
        ),
        ],
      ),
    );
  }
}
