import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the main background color here
      appBar: AppBar(
        title: const Text('Finish'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Congratulations!',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 35,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You have completed the journey',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for participating',
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