import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerButtons extends StatefulWidget {
  final AudioPlayer player;
  final Function(int) onSoundIndexChanged;

  const AudioPlayerButtons({required this.player, required this.onSoundIndexChanged, super.key});

  @override
  State<AudioPlayerButtons> createState() => _AudioPlayerButtonsState();
}

class _AudioPlayerButtonsState extends State<AudioPlayerButtons> {
  final List<String> sounds = [
    'music-1.mp3', // Waves
    'music-2.mp3', // Rain
    'music-3.mp3', // Birds
    'music-4.mp3', // Fire
    'music-5.mp3', // Forest
    'music-6.mp3',  // Wind
  ];
  int currentIndex = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    playSound();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(Icons.skip_previous, _playPreviousSound, const Color(0xffEBF4FD), const Color(0xff0F073E)),
        const SizedBox(width: 35),
        _buildIconButton(isPlaying ? Icons.pause : Icons.play_arrow, _togglePlayPause, const Color(0xff0F073E), const Color(0xffEBF4FD)),
        const SizedBox(width: 35),
        _buildIconButton(Icons.skip_next, _playNextSound, const Color(0xffEBF4FD), const Color(0xff0F073E)),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, Function onPressed, Color backgroundColor, Color iconColor) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
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
        icon: Icon(icon, size: 40, color: iconColor),
        onPressed: () => onPressed(),
      ),
    );
  }

  Future<void> playSound() async {
    try {
      final sound = sounds[currentIndex];
      await widget.player.play(AssetSource(sound));
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  Future<void> pauseSound() async {
    try {
      await widget.player.pause();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print("Error pausing sound: $e");
    }
  }

  Future<void> _playNextSound() async {
    await widget.player.pause();
    currentIndex = (currentIndex + 1) % sounds.length;
    await playSound();
    widget.onSoundIndexChanged(currentIndex);
  }

  Future<void> _playPreviousSound() async {
    await widget.player.pause();
    currentIndex = (currentIndex - 1 + sounds.length) % sounds.length;
    await playSound();
    widget.onSoundIndexChanged(currentIndex);
  }

  void _togglePlayPause() {
    if (isPlaying) {
      pauseSound();
    } else {
      playSound();
    }
  }

  @override
  void dispose() {
    widget.player.dispose();
    super.dispose();
  }
}