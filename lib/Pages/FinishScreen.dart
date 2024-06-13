import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the main background color here
      appBar: AppBar(
        title: const Text('Finish'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Congratulations!',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You have completed the journey',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
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