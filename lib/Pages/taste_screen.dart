import 'package:calmattack/Pages/finish_screen.dart';
import 'package:calmattack/Pages/smell_screen.dart';
import 'package:flutter/material.dart';

class TasteScreen extends StatelessWidget {
  const TasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: -5, right: -29, child: Image.asset('assets/Taste/doughnut.png', width: 190, height: 190),),
          Positioned(top: 85,left: -16,child: Image.asset('assets/Taste/pancake.png', width: 180, height: 180),),
          Positioned(top: 200,right: -40,child: Image.asset('assets/Taste/cupcake.png', width: 200, height: 200),),
          Positioned(bottom: 165,left: -33,child: Image.asset('assets/Taste/milkshake.png', width: 190, height: 190),),
          Positioned(bottom: 70,right: -56,child: Image.asset('assets/Taste/IceCream.png', width: 225, height: 225),),
          Positioned(bottom: 0,left: -24,child: Image.asset('assets/Taste/pineapple.png', width: 200, height: 200),),

          Column(
            children: [
              const Spacer(flex: 7), //to push Texts to the center
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
              const Spacer(flex: 5),//to push buttons to the bottom
              Column(
                children: [
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SmellScreen()));
                },
                      style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: const Color(0xff0F073E),
                  elevation: 9,
                ),
                child: const Text('      Next      ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
                  ),
                  TextButton(
                    onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FinishScreen()));
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