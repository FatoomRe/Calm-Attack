import 'package:calmattack/Pages/finish_screen.dart';
import 'package:flutter/material.dart';

class SmellScreen extends StatelessWidget {
  const SmellScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 50, left: -60, child: Image.asset('assets/Smell/F1.png', width: 250, height: 250)),
          Positioned(top: 50, right: -53, child: Image.asset('assets/Smell/F2.png', width: 250, height: 250)),
          Positioned(top: 293, left: -29, child: Image.asset('assets/Smell/F3.png', width: 150, height: 150)),
          Positioned(top: 293, right: -44, child: Image.asset('assets/Smell/F4.png', width: 160, height: 160)),
          Positioned(bottom: 90, left: -40, child: Image.asset('assets/Smell/F5.png', width: 230, height: 230)),
          Positioned(bottom:35, right: -84, child: Image.asset('assets/Smell/F6.png', width: 300, height:300)),
          Positioned(bottom: -15, left: -25, child: Image.asset('assets/Smell/F7.png', width: 130, height: 130)),
          Positioned(bottom: -7, right: -24, child: Image.asset('assets/Smell/F8.png', width: 140, height: 140)),
          Column( 
            children: [
              const Spacer(flex: 7),
                Center(
                  child: Column(
                    children: [
                      const Text('Imagine the smell of\nLavender',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1.3,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff0F073E),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Or smell any available scent',
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
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FinishScreen()));
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