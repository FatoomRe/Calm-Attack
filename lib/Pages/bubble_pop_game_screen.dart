/// Bubble Pop Game screen for the Calm Attack application.
///
/// This screen provides an interactive bubble-popping game designed to
/// help users focus their attention and redirect anxious thoughts through
/// concentration on sequential number-based gameplay.

import 'package:flutter/material.dart';
import 'dart:math';

import 'finish_screen.dart';
import '../core/constants/app_constants.dart';
import '../core/widgets/common_widgets.dart';
import '../core/utils/audio_utils.dart';
import '../core/utils/navigation_utils.dart';
import '../core/utils/session_utils.dart';
import 'package:audioplayers/audioplayers.dart';

/// The bubble pop game screen widget.
///
/// This interactive game displays numbered bubbles (1-20) that users must
/// pop in sequential order. Features include:
/// - Colorful, randomly positioned bubbles
/// - Pop sound effects for feedback
/// - Automatic game reset when completed
/// - Progress tracking through sequential numbers
class BubblePopGameScreen extends StatefulWidget {
  /// The start time of the current session
  final DateTime? startTime;

  const BubblePopGameScreen({super.key, this.startTime});

  @override
  State<BubblePopGameScreen> createState() => _BubblePopGameScreenState();
}

class _BubblePopGameScreenState extends State<BubblePopGameScreen> {
  /// List of bubble positions on screen
  List<Offset> _bubbles = [];

  /// List of bubble numbers (1 to 20)
  List<int> _bubbleNumbers = [];

  /// List of bubble colors
  List<Color> _bubbleColors = [];

  /// The next correct number the user should tap
  int _nextNumberToPop = 1;

  /// Random number generator for positioning and colors
  final Random _random = Random();

  /// Cached dimensions to avoid unnecessary regeneration
  double? _lastBubbleAreaWidth;
  double? _lastBubbleAreaHeight;

  /// Audio player for pop sound effects
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Initial bubble generation will happen in build when we have screen dimensions
  }

  @override
  void dispose() {
    AudioUtils.disposeAudioPlayer(_audioPlayer);
    super.dispose();
  }

  /// Generates unique vivid colors using HSV color space for better visual appeal.
  ///
  /// [count] - Number of unique colors to generate
  /// Returns a list of vibrant, evenly distributed colors
  List<Color> _generateUniqueVividColors(int count) {
    return List.generate(count, (i) {
      // Distribute hues evenly across the color spectrum
      double hue = (i * (360.0 / count)) % 360;
      return HSVColor.fromAHSV(
        1.0,
        hue,
        GameConstants.bubbleColorSaturation,
        GameConstants.bubbleColorValue,
      ).toColor();
    })
      ..shuffle(_random); // Shuffle for randomness
  }

  /// Generates bubbles with random non-overlapping positions.
  ///
  /// [bubbleAreaWidth] - Available width for bubble placement
  /// [bubbleAreaHeight] - Available height for bubble placement
  void _generateBubbles(double bubbleAreaWidth, double bubbleAreaHeight) {
    // Use 90% of the provided width to match the centered container
    final double effectiveWidth = bubbleAreaWidth * 0.9;
    final double bubbleSize = bubbleAreaWidth * AppSizes.bubbleSizeRatio;

    _bubbles.clear();
    _bubbleNumbers.clear();
    _bubbleColors.clear();

    final colors = _generateUniqueVividColors(GameConstants.totalBubbles);

    for (int i = 1; i <= GameConstants.totalBubbles; i++) {
      final newBubblePosition = _findNonOverlappingPosition(
        effectiveWidth,
        bubbleAreaHeight,
        bubbleSize,
      );

      _bubbles.add(newBubblePosition);
      _bubbleNumbers.add(i);
      _bubbleColors.add(colors[i - 1]);
    }
  }

  /// Finds a non-overlapping position for a new bubble.
  ///
  /// Uses multiple attempts to find a position that doesn't overlap
  /// with existing bubbles. Falls back to any position if max attempts reached.
  Offset _findNonOverlappingPosition(
    double bubbleAreaWidth,
    double bubbleAreaHeight,
    double bubbleSize,
  ) {
    Offset newBubblePosition;
    int attempts = 0;

    do {
      newBubblePosition = Offset(
        _random.nextDouble() * (bubbleAreaWidth - bubbleSize),
        _random.nextDouble() * (bubbleAreaHeight - bubbleSize),
      );
      attempts++;

      // Prevent infinite loops
      if (attempts > GameConstants.maxBubbleGenerationAttempts) break;
    } while (_isOverlapping(newBubblePosition, bubbleSize));

    return newBubblePosition;
  }

  /// Checks if a bubble position overlaps with existing bubbles.
  bool _isOverlapping(Offset position, double bubbleSize) {
    return _bubbles.any((bubble) =>
        (bubble.dx - position.dx).abs() < bubbleSize &&
        (bubble.dy - position.dy).abs() < bubbleSize);
  }

  /// Plays a random pop sound from the available sound effects.
  Future<void> _playPopSound() async {
    await AudioUtils.playRandomSound(_audioPlayer, AppAudio.popSounds);
  }

  /// Handles bubble tap logic and game progression.
  ///
  /// [index] - Index of the tapped bubble in the arrays
  void _popBubble(int index) {
    if (_bubbleNumbers[index] == _nextNumberToPop) {
      _handleCorrectBubblePop(index);
    } else {
      _handleIncorrectBubblePop();
    }
  }

  /// Handles correct bubble pop - plays sound and updates game state.
  void _handleCorrectBubblePop(int index) {
    _playPopSound();

    setState(() {
      _bubbles.removeAt(index);
      _bubbleNumbers.removeAt(index);
      _bubbleColors.removeAt(index);
      _nextNumberToPop++;

      // Reset game when all bubbles are popped
      if (_bubbles.isEmpty) {
        _resetGame();
      }
    });
  }

  /// Handles incorrect bubble pop - shows user guidance.
  void _handleIncorrectBubblePop() {
    NavigationUtils.showSnackBar(
      context,
      'Please pop bubble number $_nextNumberToPop',
    );
  }

  /// Resets the game with a new bubble layout and restarts progression.
  void _resetGame() {
    // Use the last known dimensions if available, otherwise get current screen size
    if (_lastBubbleAreaWidth != null && _lastBubbleAreaHeight != null) {
      _generateBubbles(_lastBubbleAreaWidth!, _lastBubbleAreaHeight!);
    }
    _nextNumberToPop = 1;
  }

  /// Calculates the available height for bubble placement.
  double _calculateBubbleAreaHeight(double screenHeight) {
    // Reserve space for header, navigation, and spacers
    // This gives more appropriate space for the bubbles
    return screenHeight * 0.55; // 55% of screen height for bubble area
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          final bubbleAreaHeight = _calculateBubbleAreaHeight(screenHeight);

          // Generate new bubbles if needed
          _ensureBubblesGenerated(screenWidth, bubbleAreaHeight);

          return _buildMainContent(
              context, screenWidth, screenHeight, bubbleAreaHeight);
        },
      ),
    );
  }

  /// Builds the main content column with consistent layout like other pages.
  Widget _buildMainContent(BuildContext context, double screenWidth,
      double screenHeight, double bubbleAreaHeight) {
    return Column(
      children: [
        const Spacer(flex: 3), // Keep header position unchanged
        _buildHeader(),
        _buildBubbleArea(screenWidth, bubbleAreaHeight), // Removed spacer to move bubble area up
        const Spacer(flex: 1), // Added spacer to move buttons down
        _buildNavigationButtons(context, screenWidth),
        const Spacer(flex: 1), // Reduced bottom spacing to compensate
      ],
    );
  }

  /// Ensures bubbles are generated if needed.
  void _ensureBubblesGenerated(double screenWidth, double bubbleAreaHeight) {
    if (_bubbles.isEmpty ||
        _lastBubbleAreaWidth != screenWidth ||
        _lastBubbleAreaHeight != bubbleAreaHeight) {
      _generateBubbles(screenWidth, bubbleAreaHeight);
      _lastBubbleAreaWidth = screenWidth;
      _lastBubbleAreaHeight = bubbleAreaHeight;
      _nextNumberToPop = 1;
    }
  }

  /// Builds the game header with instructions.
  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: AppSizes.spacingLarge), // Increased to move text down more
          Text(
            'Pop the Bubbles\nin Order',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3.copyWith(
              letterSpacing: 1.3,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the interactive bubble area.
  Widget _buildBubbleArea(double screenWidth, double bubbleAreaHeight) {
    final double bubbleSize = screenWidth * AppSizes.bubbleSizeRatio;

    return Center(
      child: Container(
        width: screenWidth * 0.9, // Use 90% of screen width
        height: bubbleAreaHeight,
        child: Stack(
          children: _bubbles.asMap().entries.map((entry) {
            int index = entry.key;
            Offset position = entry.value;

            return Positioned(
              left: position.dx,
              top: position.dy,
              child: GestureDetector(
                onTap: () => _popBubble(index),
                child: CustomPaint(
                  size: Size(bubbleSize, bubbleSize),
                  painter: _BubblePainter(
                    color: _bubbleColors[index],
                    number: _bubbleNumbers[index],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  /// Builds the navigation buttons section.
  Widget _buildNavigationButtons(BuildContext context, double screenWidth) {
    final sessionStart = widget.startTime ?? SessionUtils.createSessionStart();

    return Column(
      children: [
        AppElevatedButton(
          text: 'Next',
          widthRatio: AppSizes.buttonWidthRatio,
          onPressed: () => _navigateToFinish(sessionStart),
        ),
        AppTextButton(
          text: 'Finish Session',
          onPressed: () => _navigateToFinish(sessionStart),
        ),
      ],
    );
  }

  /// Navigates to the finish screen.
  void _navigateToFinish(DateTime startTime) {
    NavigationUtils.navigateToScreen(
      context,
      FinishScreen(startTime: startTime),
    );
  }
}

/// Custom painter for rendering individual bubbles with glossy effect.
///
/// Creates realistic-looking bubbles with:
/// - Radial gradient for depth
/// - Multiple highlight layers for glossy appearance
/// - Centered number text with shadow
class _BubblePainter extends CustomPainter {
  /// Bubble background color
  final Color color;

  /// Number displayed in the bubble center
  final int number;

  const _BubblePainter({
    required this.color,
    required this.number,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    _drawBubbleBackground(canvas, center, radius);
    _drawHighlights(canvas, size);
    _drawBubbleNumber(canvas, size);
  }

  /// Draws the main bubble background with radial gradient.
  void _drawBubbleBackground(Canvas canvas, Offset center, double radius) {
    final bubblePaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, -0.3),
        radius: 0.8,
        colors: [
          color.withValues(alpha: 0.97),
          color.withValues(alpha: 0.72),
          Colors.white.withValues(alpha: 0.33),
        ],
        stops: const [0.13, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, bubblePaint);
  }

  /// Draws highlight effects for glossy appearance.
  void _drawHighlights(Canvas canvas, Size size) {
    // Top-left highlight
    final highlightPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.22);
    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.18,
        size.height * 0.15,
        size.width * 0.3,
        size.height * 0.22,
      ),
      highlightPaint,
    );

    // Bottom-right shine
    final shinePaint = Paint()..color = Colors.white.withValues(alpha: 0.12);
    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.58,
        size.height * 0.62,
        size.width * 0.18,
        size.height * 0.10,
      ),
      shinePaint,
    );
  }

  /// Draws the bubble number with shadow effect.
  void _drawBubbleNumber(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$number',
        style: TextStyle(
          color: AppColors.textOnPrimary,
          fontWeight: FontWeight.bold,
          fontSize: size.width * 0.42,
          shadows: [
            Shadow(
              blurRadius: 6,
              color: Colors.black.withValues(alpha: 0.20),
              offset: const Offset(1, 2),
            )
          ],
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(_BubblePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.number != number;
}
