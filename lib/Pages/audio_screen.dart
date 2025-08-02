/// Audio screen for the Calm Attack application.
///
/// This screen provides a sound therapy experience with nature and ambient
/// sounds to help users focus their attention and achieve a calmer mental state.
/// Features multiple audio tracks with visual spectrum animation.

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../Animations/audio_spectrum_lines.dart';
import '../Buttons/audio_player_buttons.dart';
import 'finish_screen.dart';
import 'vibration_screen.dart';
import '../core/constants/app_constants.dart';
import '../core/widgets/common_widgets.dart';
import '../core/utils/navigation_utils.dart';
import '../core/utils/audio_utils.dart';

/// The audio screen widget providing sound therapy features.
///
/// This screen displays:
/// - Dynamic sound name with gradient text effect
/// - Audio spectrum visualization animation
/// - Audio player controls for play/pause and track selection
/// - Navigation buttons for Next/Finish
class AudioScreen extends StatefulWidget {
  /// The start time of the current session for tracking purposes
  final DateTime startTime;

  const AudioScreen({super.key, required this.startTime});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  /// Index to track the currently playing sound
  int _currentSoundIndex = 0;

  /// Audio player instance for managing playback
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// Track play/pause state for UI updates
  bool _isPlaying = false;

  @override
  void dispose() {
    AudioUtils.disposeAudioPlayer(_audioPlayer);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildCurrentSoundTitle(),
              SizedBox(height: screenHeight * 0.03),
              _buildAudioSpectrumContainer(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.06),
              _buildAudioPlayerButtons(),
              SizedBox(height: screenHeight * 0.04),
              _buildNavigationButtons(context, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the main header text.
  Widget _buildHeader() {
    return const Text(
      'Focus on',
      style: AppTextStyles.heading2,
    );
  }

  /// Builds the current sound title with gradient effect.
  Widget _buildCurrentSoundTitle() {
    final Shader linearGradient = const LinearGradient(
      colors: [AppColors.accentBlue, AppColors.accentTeal],
      stops: [0.1, 0.40],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return ShaderMask(
      shaderCallback: (bounds) => linearGradient,
      child: Text(
        AppAudio.musicLabels[_currentSoundIndex],
        style: AppTextStyles.heading2.copyWith(
          color: AppColors.textOnPrimary,
        ),
      ),
    );
  }

  /// Builds the audio spectrum animation container.
  Widget _buildAudioSpectrumContainer(double screenWidth, double screenHeight) {
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
            color: Colors.grey.withValues(alpha: 0.7),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: AudioSpectrumLines(isPlaying: _isPlaying),
      ),
    );
  }

  /// Builds the audio player control buttons.
  Widget _buildAudioPlayerButtons() {
    return AudioPlayerButtons(
      player: _audioPlayer,
      onSoundIndexChanged: _handleSoundIndexChanged,
      onPlayPauseChanged: _handlePlayPauseChanged,
    );
  }

  /// Builds the navigation buttons section.
  Widget _buildNavigationButtons(BuildContext context, double screenWidth) {
    return Column(
      children: [
        AppElevatedButton(
          text: 'Next',
          widthRatio: AppSizes.buttonWidthRatio,
          onPressed: () => _navigateToVibrationScreen(),
        ),
        AppTextButton(
          text: 'Finish Session',
          onPressed: () => _navigateToFinishScreen(),
        ),
      ],
    );
  }

  /// Handles sound index changes from the audio player buttons.
  void _handleSoundIndexChanged(int index) {
    setState(() {
      _currentSoundIndex = index;
    });
  }

  /// Handles play/pause state changes from the audio player buttons.
  void _handlePlayPauseChanged(bool playing) {
    setState(() {
      _isPlaying = playing;
    });
  }

  /// Navigates to the vibration screen.
  void _navigateToVibrationScreen() {
    _stopAudioAndNavigate(() {
      NavigationUtils.navigateToScreen(
        context,
        VibrationScreen(startTime: widget.startTime),
      );
    });
  }

  /// Navigates to the finish screen.
  void _navigateToFinishScreen() {
    _stopAudioAndNavigate(() {
      NavigationUtils.navigateToScreen(
        context,
        FinishScreen(startTime: widget.startTime),
      );
    });
  }

  /// Stops audio playback before navigation.
  void _stopAudioAndNavigate(VoidCallback navigationCallback) async {
    await AudioUtils.stopAudio(_audioPlayer);
    navigationCallback();
  }
}
