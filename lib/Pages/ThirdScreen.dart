// ignore_for_file: file_names
//import 'package:calmattack/Animations/AudioSpectrumLines.dart';
import 'package:calmattack/Animations/AudioSpectrumLines.dart';
import 'package:calmattack/Buttons/AudioPlayerButoons.dart';
import 'package:calmattack/Pages/FourthScreen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  int currentSoundIndex = 0;

  List<String> soundTexts = [
    'Waves',
    'Rain',
    'Birds',
    'Fire',
    'Forest',
    'Wind',
  ];

  final player = AudioPlayer();

  AudioPlayer audioCache = AudioPlayer();

  List<String> sounds = [
    'assets/music-1.mp3',
    'assets/music-2.mp3',
    'assets/music-3.mp3',
    'assets/music-4.mp3',
    'assets/music-5.mp3',
    'assets/music-6.mp3',
  ];

  int currentIndex = 0;

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
      backgroundColor: Colors.white, // Set the main background color here
      body: Center(
        child: Column(
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
            //--------------------------------------------------------------------
            ShaderMask(
              shaderCallback: (bounds) => linearGradient,
              child: Text(
                soundTexts[currentSoundIndex],
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //-----------------------------the Audio Spectrum container-----------
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
              child: const Center(
                child: AudioSpectrumLines(),
                // width: 200,
                // height: 200,),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            AudioPlayerButtons(
              onSoundIndexChanged: (index) {
                setState(() {
                  currentSoundIndex = index;
                });
              },
            ), //<------------- (The AudioPlayer Buttons ) ------


            const SizedBox(
              height: 45,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FourthScreen()));
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
            TextButton(onPressed: () {}, child: const Text('Finish Session')),
          ],
        ),
      ),
    );
  }
}
