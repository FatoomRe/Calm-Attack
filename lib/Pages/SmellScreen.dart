import 'package:flutter/material.dart';

class SmellScreen extends StatelessWidget {
  const SmellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the main background color here
      appBar: AppBar(
        title: const Text('Smell'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Focus on',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Smell',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Coming Soon',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}