import 'package:calmattack/Pages/finish_screen.dart';
import 'package:calmattack/Pages/smell_screen.dart';
import 'package:flutter/material.dart';

class TasteScreen extends StatelessWidget {
  const TasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              Positioned(
                top: screenHeight * -0.005,
                right: screenWidth * -0.05,
                child: Image.asset(
                  'assets/Taste/doughnut.png',
                  width: screenWidth * 0.40,
                  height: screenWidth * 0.40,
                ),
              ),
              Positioned(
                top: screenHeight * 0.1,
                left: screenWidth * -0.05,
                child: Image.asset(
                  'assets/Taste/pancake.png',
                  width: screenWidth * 0.40,
                  height: screenWidth * 0.40,
                ),
              ),
              Positioned(
                top: screenHeight * 0.25,
                right: screenWidth * -0.1,
                child: Image.asset(
                  'assets/Taste/cupcake.png',
                  width: screenWidth * 0.50,
                  height: screenWidth * 0.50,
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.2,
                left: screenWidth * -0.09,
                child: Image.asset(
                  'assets/Taste/milkshake.png',
                  width: screenWidth * 0.50,
                  height: screenWidth * 0.50,
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.1,
                right: screenWidth * -0.15,
                child: Image.asset(
                  'assets/Taste/IceCream.png',
                  width: screenWidth * 0.60,
                  height: screenWidth * 0.60,
                ),
              ),
              Positioned(
                bottom: screenHeight * 0.00,
                left: screenWidth * -0.05,
                child: Image.asset(
                  'assets/Taste/pineapple.png',
                  width: screenWidth * 0.40,
                  height: screenWidth * 0.40,
                ),
              ),
              
              Column(
                children: [
                  const Spacer(flex: 7), // to push Texts to the center
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'Imagine the taste of\nLemon Ice Cream',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.3,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff0F073E),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Or find something you can taste',
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
                  const Spacer(flex: 5), // to push buttons to the bottom
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SmellScreen()),
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
                                builder: (context) => const FinishScreen()),
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
          );
        },
      ),
    );
  }
}