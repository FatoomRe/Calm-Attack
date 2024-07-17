import 'package:audioplayers/audioplayers.dart';
import 'package:calmattack/Animations/audio_spectrum_lines.dart';
import 'package:calmattack/Buttons/audio_player_butoons.dart';
import 'package:calmattack/Pages/finish_screen.dart';
import 'package:calmattack/Pages/vibration_screen.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  int currentSoundIndex = 0;
  final AudioPlayer player = AudioPlayer();
  final List<String> soundTexts = ['Waves', 'Rain', 'Birds', 'Fire', 'Forest', 'Wind'];
  final List<String> sounds = [
    'assets/music-1.mp3',
    'assets/music-2.mp3',
    'assets/music-3.mp3',
    'assets/music-4.mp3',
    'assets/music-5.mp3',
    'assets/music-6.mp3',
  ];

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xff3E3BD4), Color(0xff1AAC9B)],
      stops: [0.1, 0.40],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Focus on',
                style: TextStyle(
                  color: Color(0xff0F073E),
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) => linearGradient,
                child: Text(
                  soundTexts[currentSoundIndex],
                  style: const TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: screenWidth * 0.7,
                height: screenHeight * 0.4,
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
                child: const Center(child: AudioSpectrumLines()),
              ),
              SizedBox(height: screenHeight * 0.06),
              AudioPlayerButtons(
                player: player,
                onSoundIndexChanged: (index) {
                  setState(() {
                    currentSoundIndex = index;
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () async {
                    await player.stop();
                    if (!mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VibrationScreen()),
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
                    MaterialPageRoute(builder: (context) => const FinishScreen()),
                  );
                },
                child: const Text('Finish Session'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}