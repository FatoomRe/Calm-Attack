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
          child: const Text(
            'Next',
            style: TextStyle(
              color: Color.fromARGB(255, 5, 0, 0),
              fontSize: 20,
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
