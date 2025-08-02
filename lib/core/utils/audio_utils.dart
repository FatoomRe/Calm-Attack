/// Audio management utilities for the Calm Attack application.
///
/// This file contains helper functions and utilities for handling
/// audio playback throughout the app in a consistent manner.

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

/// Audio management utilities class.
///
/// This class provides centralized audio logic to maintain consistency
/// and reduce code duplication across different screens.
class AudioUtils {
  /// Plays an audio file from assets.
  ///
  /// [audioPlayer] - The AudioPlayer instance to use
  /// [assetPath] - Path to the audio asset (with or without 'assets/' prefix)
  ///
  /// Returns true if playback started successfully, false otherwise.
  static Future<bool> playAudioAsset(
    AudioPlayer audioPlayer,
    String assetPath,
  ) async {
    try {
      // Remove 'assets/' prefix if present for AudioPlayer
      final cleanPath =
          assetPath.startsWith('assets/') ? assetPath.substring(7) : assetPath;

      await audioPlayer.play(AssetSource(cleanPath));
      return true;
    } catch (e) {
      // Log error in debug mode but don't crash the app
      assert(false, 'Audio playback error: $e');
      return false;
    }
  }

  /// Stops audio playback.
  ///
  /// [audioPlayer] - The AudioPlayer instance to stop
  ///
  /// Returns true if stop was successful, false otherwise.
  static Future<bool> stopAudio(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.stop();
      return true;
    } catch (e) {
      // Log error in debug mode but don't crash the app
      assert(false, 'Audio stop error: $e');
      return false;
    }
  }

  /// Pauses audio playback.
  ///
  /// [audioPlayer] - The AudioPlayer instance to pause
  ///
  /// Returns true if pause was successful, false otherwise.
  static Future<bool> pauseAudio(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.pause();
      return true;
    } catch (e) {
      // Log error in debug mode but don't crash the app
      assert(false, 'Audio pause error: $e');
      return false;
    }
  }

  /// Resumes audio playback.
  ///
  /// [audioPlayer] - The AudioPlayer instance to resume
  ///
  /// Returns true if resume was successful, false otherwise.
  static Future<bool> resumeAudio(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.resume();
      return true;
    } catch (e) {
      // Log error in debug mode but don't crash the app
      assert(false, 'Audio resume error: $e');
      return false;
    }
  }

  /// Plays a random sound from a list of audio assets.
  ///
  /// [audioPlayer] - The AudioPlayer instance to use
  /// [soundPaths] - List of audio asset paths
  ///
  /// Returns the index of the played sound, or -1 if playback failed.
  static Future<int> playRandomSound(
    AudioPlayer audioPlayer,
    List<String> soundPaths,
  ) async {
    if (soundPaths.isEmpty) return -1;

    final random = Random();
    final index = random.nextInt(soundPaths.length);
    final success = await playAudioAsset(audioPlayer, soundPaths[index]);

    return success ? index : -1;
  }

  /// Sets the volume for an audio player.
  ///
  /// [audioPlayer] - The AudioPlayer instance
  /// [volume] - Volume level (0.0 to 1.0)
  ///
  /// Returns true if volume was set successfully, false otherwise.
  static Future<bool> setVolume(
    AudioPlayer audioPlayer,
    double volume,
  ) async {
    try {
      // Clamp volume between 0.0 and 1.0
      final clampedVolume = volume.clamp(0.0, 1.0);
      await audioPlayer.setVolume(clampedVolume);
      return true;
    } catch (e) {
      // Log error in debug mode but don't crash the app
      assert(false, 'Volume setting error: $e');
      return false;
    }
  }

  /// Checks if an audio player is currently playing.
  ///
  /// [audioPlayer] - The AudioPlayer instance to check
  ///
  /// Returns true if audio is playing, false otherwise.
  static bool isPlaying(AudioPlayer audioPlayer) {
    return audioPlayer.state == PlayerState.playing;
  }

  /// Checks if an audio player is currently paused.
  ///
  /// [audioPlayer] - The AudioPlayer instance to check
  ///
  /// Returns true if audio is paused, false otherwise.
  static bool isPaused(AudioPlayer audioPlayer) {
    return audioPlayer.state == PlayerState.paused;
  }

  /// Safely disposes of an audio player.
  ///
  /// [audioPlayer] - The AudioPlayer instance to dispose
  static Future<void> disposeAudioPlayer(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.stop();
      await audioPlayer.dispose();
    } catch (e) {
      // Log error in debug mode but continue cleanup
      debugPrint('Audio disposal error: $e');
    }
  }

  /// Private constructor to prevent instantiation
  AudioUtils._();
}
