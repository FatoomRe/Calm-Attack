import 'package:calmattack/Pages/bubble_pop_game_screen.dart';
import 'package:calmattack/Pages/finish_screen.dart';
import 'package:flutter/material.dart';

class SmellScreen extends StatelessWidget {
  final DateTime startTime;
  const SmellScreen({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.08,
            left: screenWidth * -0.01,
            child: Image.asset(
              'assets/Smell/F1.png',
              width: screenWidth * 0.30,
              height: screenHeight * 0.30,
            ),
          ),
          Positioned(
            top: screenHeight * 0.08,
            right: screenWidth * -0.00,
            child: Image.asset(
              'assets/Smell/F2.png',
              width: screenWidth * 0.40,
              height: screenHeight * 0.40,
            ),
          ),
          Positioned(
            top: screenHeight * 0.44,
            left: screenWidth * -0.08,
            child: Image.asset(
              'assets/Smell/F3.png',
              width: screenWidth * 0.375,
              height: screenHeight * 0.1875,
            ),
          ),
          Positioned(
            top: screenHeight * 0.44,
            right: screenWidth * -0.12,
            child: Image.asset(
              'assets/Smell/F4.png',
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.09,
            left: screenWidth * -0.00,
            child: Image.asset(
              'assets/Smell/F5.png',
              width: screenWidth * 0.40,
              height: screenHeight * 0.40,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.01,
            right: screenWidth * -0.06,
            child: Image.asset(
              'assets/Smell/F6.png',
              width: screenWidth * 0.45,
              height: screenHeight * 0.45,
            ),
          ),
          Positioned(
            bottom: screenHeight * -0.01875,
            left: screenWidth * -0.09,
            child: Image.asset(
              'assets/Smell/F7.png',
              width: screenWidth * 0.325,
              height: screenHeight * 0.1625,
            ),
          ),
          Positioned(
            bottom: screenHeight * -0.0175,
            right: screenWidth * -0.09,
            child: Image.asset(
              'assets/Smell/F8.png',
              width: screenWidth * 0.35,
              height: screenHeight * 0.175,
            ),
          ),
          Column(
            children: [
              const Spacer(flex: 7),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Imagine the smell of\nLavender',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1.3,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff0F073E),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Or smell any available scent',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 5),
              Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BubblePopGameScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0F073E),
                        elevation: 9,
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FinishScreen(startTime: startTime),
                        ),
                      );
                    },
                    child: const Text('Finish Session'),
                  ),
                ],
              ),
              // Spacer to add some padding at the bottom
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
