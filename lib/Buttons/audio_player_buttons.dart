// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerButtons extends StatefulWidget {
  final AudioPlayer player;
  final Function(int) onSoundIndexChanged;
  final Function(bool)
      onPlayPauseChanged; // Callback to notify play/pause state

  const AudioPlayerButtons(
      {required this.player,
      required this.onSoundIndexChanged,
      required this.onPlayPauseChanged,
      super.key});

  @override
  State<AudioPlayerButtons> createState() => _AudioPlayerButtonsState();
}

class _AudioPlayerButtonsState extends State<AudioPlayerButtons> {
  // List of sound file names.
  final List<String> sounds = [
    'music-1.mp3', // Waves
    'music-2.mp3', // Rain
    'music-3.mp3', // Birds
    'music-4.mp3', // Fire
    'music-5.mp3', // Forest
    'music-6.mp3', // Wind
  ];
  int currentIndex = 0; // Index of the currently playing sound.
  bool isPlaying = false; // Flag to track play/pause state.

  @override
  void initState() {
    super.initState();
    playSound(); // Automatically start playing the first sound on widget initialization.
  }

  @override
  Widget build(BuildContext context) {
    // Building a row of control buttons: previous, play/pause, next.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous button
        _buildIconButton(Icons.skip_previous, _playPreviousSound,
            const Color(0xffEBF4FD), const Color(0xff0F073E)),
        const SizedBox(width: 35),
        // Play/Pause toggle button
        _buildIconButton(isPlaying ? Icons.pause : Icons.play_arrow,
            _togglePlayPause, const Color(0xff0F073E), const Color(0xffEBF4FD)),
        const SizedBox(width: 35),
        // Next button
        _buildIconButton(Icons.skip_next, _playNextSound,
            const Color(0xffEBF4FD), const Color(0xff0F073E)),
      ],
    );
  }

  // Helper method to build icon buttons with custom styles.
  Widget _buildIconButton(IconData icon, Function onPressed,
      Color backgroundColor, Color iconColor) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.7),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 40, color: iconColor),
        onPressed: () => onPressed(),
      ),
    );
  }

  // Method to play a sound from the list based on currentIndex.
  Future<void> playSound() async {
    try {
      final sound = sounds[currentIndex];
      await widget.player.play(AssetSource(sound));
      setState(() {
        isPlaying = true;
      });
      widget.onPlayPauseChanged(isPlaying); // Notify parent widget
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  // Method to pause the currently playing sound.
  Future<void> pauseSound() async {
    try {
      await widget.player.pause();
      setState(() {
        isPlaying = false;
      });
      widget.onPlayPauseChanged(isPlaying);
    } catch (e) {
      print("Error pausing sound: $e");
    }
  }

  // Method to play the next sound in the list.
  Future<void> _playNextSound() async {
    await widget.player.pause();
    currentIndex =
        (currentIndex + 1) % sounds.length; // Cycle through the list.
    await playSound();
    widget.onSoundIndexChanged(currentIndex); // Notify the change.
  }

  // Method to play the previous sound in the list.
  Future<void> _playPreviousSound() async {
    await widget.player.pause();
    currentIndex = (currentIndex - 1 + sounds.length) %
        sounds.length; // Cycle backwards through the list.
    await playSound();
    widget.onSoundIndexChanged(currentIndex); // Notify the change.
  }

  // Method to toggle between play and pause states.
  void _togglePlayPause() {
    if (isPlaying) {
      pauseSound();
    } else {
      playSound();
    }
  }

  @override
  void dispose() {
    widget.player
        .dispose(); // Dispose of the AudioPlayer when the widget is disposed.
    super.dispose();
  }
}
