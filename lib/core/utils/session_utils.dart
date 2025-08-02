/// Session management utilities for the Calm Attack application.
///
/// This file contains utilities for managing user sessions,
/// tracking time, and handling session-related data.

/// Session management utilities class.
///
/// This class provides centralized session logic for tracking
/// user progress and session duration throughout the app.
class SessionUtils {
  /// Calculates the duration between start and end times.
  ///
  /// [startTime] - The session start time
  /// [endTime] - The session end time (optional, defaults to now)
  ///
  /// Returns the duration in minutes.
  static int calculateSessionDurationInMinutes(
    DateTime startTime, [
    DateTime? endTime,
  ]) {
    final end = endTime ?? DateTime.now();
    final duration = end.difference(startTime);
    return duration.inMinutes;
  }

  /// Calculates the duration between start and end times.
  ///
  /// [startTime] - The session start time
  /// [endTime] - The session end time (optional, defaults to now)
  ///
  /// Returns the duration as a Duration object.
  static Duration calculateSessionDuration(
    DateTime startTime, [
    DateTime? endTime,
  ]) {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime);
  }

  /// Formats a duration into a human-readable string.
  ///
  /// [duration] - The duration to format
  /// [includeSeconds] - Whether to include seconds in the output
  ///
  /// Returns a formatted string like "5 minutes" or "1 minute 30 seconds".
  static String formatDuration(
    Duration duration, {
    bool includeSeconds = false,
  }) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;

    if (minutes == 0 && includeSeconds) {
      return seconds == 1 ? '1 second' : '$seconds seconds';
    }

    if (minutes == 0) {
      return 'Less than 1 minute';
    }

    String result = minutes == 1 ? '1 minute' : '$minutes minutes';

    if (includeSeconds && seconds > 0) {
      result += seconds == 1 ? ' 1 second' : ' $seconds seconds';
    }

    return result;
  }

  /// Creates a session start timestamp.
  ///
  /// Returns the current DateTime as a session start marker.
  static DateTime createSessionStart() {
    return DateTime.now();
  }

  /// Validates if a session start time is reasonable.
  ///
  /// [startTime] - The session start time to validate
  /// [maxDurationHours] - Maximum reasonable session duration in hours
  ///
  /// Returns true if the session time is valid, false otherwise.
  static bool isValidSessionTime(
    DateTime startTime, {
    int maxDurationHours = 24,
  }) {
    final now = DateTime.now();
    final duration = now.difference(startTime);

    // Check if start time is not in the future
    if (startTime.isAfter(now)) {
      return false;
    }

    // Check if duration is not unreasonably long
    if (duration.inHours > maxDurationHours) {
      return false;
    }

    return true;
  }

  /// Generates a congratulatory message based on session duration.
  ///
  /// [duration] - The session duration
  ///
  /// Returns an appropriate congratulatory message.
  static String generateCongratulationsMessage(Duration duration) {
    final minutes = duration.inMinutes;

    if (minutes < 1) {
      return "Great start! Every moment of self-care counts.";
    } else if (minutes < 5) {
      return "Well done! You took time for yourself.";
    } else if (minutes < 10) {
      return "Excellent! You're building great habits.";
    } else if (minutes < 20) {
      return "Amazing dedication! You're taking control.";
    } else {
      return "Outstanding commitment! You're truly prioritizing your wellbeing.";
    }
  }

  /// Checks if enough time has passed for meaningful session tracking.
  ///
  /// [startTime] - The session start time
  /// [minimumMinutes] - Minimum minutes for a meaningful session
  ///
  /// Returns true if the session duration meets the minimum threshold.
  static bool isMeaningfulSession(
    DateTime startTime, {
    int minimumMinutes = 1,
  }) {
    final duration = calculateSessionDuration(startTime);
    return duration.inMinutes >= minimumMinutes;
  }

  /// Private constructor to prevent instantiation
  SessionUtils._();
}
