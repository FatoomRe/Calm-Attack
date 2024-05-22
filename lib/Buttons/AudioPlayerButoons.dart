// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerButtons extends StatefulWidget {
  final Function(int) onSoundIndexChanged;

  const AudioPlayerButtons({required this.onSoundIndexChanged, super.key});

  @override
  State<AudioPlayerButtons> createState() => _AudioPlayerButtonsState();
}

class _AudioPlayerButtonsState extends State<AudioPlayerButtons> {
  final player = AudioPlayer();
  List<String> sounds = [
    'music-1.mp3', //Waves      
    'music-2.mp3', //Rain        
    'music-3.mp3', //Birds  
    'music-4.mp3', //Fire 
    'music-5.mp3', //Forest
    'music-6.mp3', //Wind        
  ];
  int currentIndex = 0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                Icons.skip_previous,
                size: 40,
                color: Color(0xff0F073E),
              ),
              onPressed: () {
                playPreviousSound();
              },
            ),
          ),
          const SizedBox(width: 35),
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
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 40,
                color: const Color(0xffEBF4FD),
              ),
              onPressed: () {
                if (isPlaying) {
                  pauseSound();
                } else {
                  playSound();
                }
              },
            ),
          ),
          const SizedBox(width: 35),
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
                Icons.skip_next,
                size: 40,
                color: Color(0xff0F073E),
              ),
              onPressed: () {
                playNextSound();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    playSound();
  }

  Future<void> playSound() async {
    final sound = sounds[currentIndex];
    await player.play(AssetSource(sound));
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> pauseSound() async {
    await player.pause();
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> playNextSound() async {
    player.pause();
    currentIndex = (currentIndex + 1) % sounds.length;
    await playSound();
    widget.onSoundIndexChanged(currentIndex);
  }

  Future<void> playPreviousSound() async {
    player.pause();
    currentIndex = (currentIndex - 1 + sounds.length) % sounds.length;
    await playSound();
    widget.onSoundIndexChanged(currentIndex);
  }

  
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
