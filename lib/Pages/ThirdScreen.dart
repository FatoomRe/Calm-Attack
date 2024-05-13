// ignore_for_file: file_names
import 'package:calmattack/Pages/FourthScreen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //=========================================================== wave color

    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xff3E3BD4), Color(0xff1AAC9B)],
      stops: [0.1, 0.40],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


    return Scaffold(
      backgroundColor: Colors.white, // Set the background color here
      body: Center(
        child:
         Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Focus on',
              style: TextStyle(
                color: Color(0xff0F073E),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            ShaderMask(
                shaderCallback: (bounds) => linearGradient,
              child: const Text(
                'Waves',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            //-------------------------------------------------------------------------
            Container(
              width: 270,
              height: 260,
              decoration: BoxDecoration(
                color: const Color(0xffEBF4FD),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 0.1,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset('assets/lines1.png',
              width: 200,
              height: 200,),
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //-----------------------------------------------------------------------------
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xffEBF4FD),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 0.1,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              
              child: IconButton(
                icon: const Icon(
                  Icons.fast_rewind,
                  size: 40,
                  color:  Color(0xff0F073E),), // Set the icon here
                onPressed: () {
                  // Add your onPressed code here
                },
              ),
            ),
            const SizedBox(width: 35),

            //---------------------------------------------------------------
            Container(
              width: 60,
              height: 60,
               decoration: BoxDecoration(
                color: const Color(0xff0F073E),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 0.1,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  size: 40,
                  color: Color(0xffEBF4FD),), // Set the icon here
                onPressed: () {
                  // Add your onPressed code here
                },
              ),
            ),
            const SizedBox(width: 35),
            //-----------------------------------------------------------------------
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xffEBF4FD),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 0.1,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.fast_forward,
                  size: 40,
                  color: Color(0xff0F073E),), // Set the icon here
                onPressed: () {
                  // Add your onPressed code here
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 45,),
        // ignore: sized_box_for_whitespace //-------------------------------------
        Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FourthScreen()));
              },
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: const Color(0xff0F073E),
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
          TextButton(onPressed: (){}, child: const Text('Finish Session')),
          ],
        ),
      ),
    );
  }
}
