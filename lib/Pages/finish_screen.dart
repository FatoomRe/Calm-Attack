import 'package:calmattack/Pages/start_screen.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Congratulation!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff052D94),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'You survived your panic attack, you are\nin control of your mind and body.',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Image.asset(
                'assets/cong.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                'Total Spent Time',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                '1 Minute',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff052D94),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 50,
                    width: 215,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        backgroundColor: const Color(0xff052D94),
                        elevation: 9,
                      ),
                      child: const Text(' Back to Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
