// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import '../Animations/audio_spectrum_lines.dart';
import '../Buttons/audio_player_buttons.dart';
import '../Pages/finish_screen.dart';
import '../Pages/vibration_screen.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  final DateTime startTime;
  const AudioScreen({super.key, required this.startTime});

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  int currentSoundIndex = 0; // Index to track the currently playing sound.
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false; // Track play/pause state.

  final List<String> soundTexts = [
    'Waves',
    'Rain',
    'Birds',
    'Fire',
    'Forest',
    'Wind'
  ]; // List of descriptive texts for each sound.

  final List<String> sounds = [
    'assets/music-1.mp3',
    'assets/music-2.mp3',
    'assets/music-3.mp3',
    'assets/music-4.mp3',
    'assets/music-5.mp3',
    'assets/music-6.mp3',
  ]; // List of sound file paths.

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
          padding: EdgeInsets.only(top: screenHeight * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              buildAudioSpectrumContainer(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.06),
              AudioPlayerButtons(
                player: player,
                onSoundIndexChanged: (index) {
                  setState(() {
                    currentSoundIndex = index;
                  });
                },
                onPlayPauseChanged: (playing) {
                  setState(() {
                    isPlaying = playing; // Update play/pause state
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              buildNextButton(context, screenWidth),
              TextButton(
                onPressed: () async {
                  await player.stop();
                  if (!mounted) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FinishScreen(startTime: widget.startTime),
                    ),
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

  // Function to build the audio spectrum container.
  Container buildAudioSpectrumContainer(
      double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.7,
      height: screenHeight * 0.4,
      constraints: const BoxConstraints(
        minWidth: 250,
        minHeight: 200,
        maxWidth: 400,
        maxHeight: 300,
      ),
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
        child:
            AudioSpectrumLines(isPlaying: isPlaying), // Pass play/pause state
      ),
    );
  }

  // Function to build the 'Next' button.
  SizedBox buildNextButton(BuildContext context, double screenWidth) {
    return SizedBox(
      height: 50,
      width: screenWidth * 0.45,
      child: ElevatedButton(
        onPressed: () async {
          await player.stop();
          if (!mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  VibrationScreen(startTime: widget.startTime),
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
    );
  }
}
