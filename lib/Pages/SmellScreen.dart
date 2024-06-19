import 'package:flutter/material.dart';

class SmellScreen extends StatelessWidget {
  const SmellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the main background color here
      appBar: AppBar(
        title: const Text('Smell'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Focus on',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 35,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Smell',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 35,
              ),
            ),
            SizedBox(height: 20),
            Text(
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