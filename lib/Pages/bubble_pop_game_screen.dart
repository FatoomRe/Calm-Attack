import 'package:calmattack/Pages/finish_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class BubblePopGameScreen extends StatefulWidget {
  const BubblePopGameScreen({super.key});

  @override
  _BubblePopGameScreenState createState() => _BubblePopGameScreenState();
}

class _BubblePopGameScreenState extends State<BubblePopGameScreen> {
  List<Offset> bubbles = []; // Stores bubble positions
  List<int> bubbleNumbers = []; // Stores bubble numbers (1 to 20)
  List<Color> bubbleColors = []; // Stores colors of the bubbles
  int nextNumberToPop = 1; // The next correct number user should tap
  Random random = Random(); // For generating random positions/colors

  double? lastBubbleAreaWidth; // Cache last known width of bubble area
  double? lastBubbleAreaHeight; // Cache last known height of bubble area

  static const int totalBubbles = 20; // Total number of bubbles
  final List<String> popSounds = [
    'assets/pop1.mp3',
    'assets/pop2.mp3',
    'assets/pop3.mp3',
  ]; // Pop sound assets
  final AudioPlayer audioPlayer = AudioPlayer(); // Audio player instance

  // Generates unique vivid colors using HSV color space
  List<Color> generateUniqueVividColors(int count) {
    return List.generate(count, (i) {
      double hue = (i * (360.0 / count)) % 360; // Spread hues evenly
      return HSVColor.fromAHSV(1.0, hue, 0.95, 0.95).toColor(); // Convert HSV to Color
    })..shuffle(random); // Shuffle for randomness
  }

  // Generate bubbles with random non-overlapping positions
  void generateBubbles(double bubbleAreaWidth, double bubbleAreaHeight) {
    final double bubbleSize = bubbleAreaWidth * 0.12;

    bubbles.clear();
    bubbleNumbers.clear();
    bubbleColors.clear();

    final colors = generateUniqueVividColors(totalBubbles); // Get vivid colors

    for (int i = 1; i <= totalBubbles; i++) {
      Offset newBubblePosition;
      int tries = 0;

      // Keep trying until a non-overlapping position is found
      do {
        newBubblePosition = Offset(
          random.nextDouble() * (bubbleAreaWidth - bubbleSize),
          random.nextDouble() * (bubbleAreaHeight - bubbleSize),
        );
        tries++;
        if (tries > 1000) break; // Avoid infinite loops
      } while (bubbles.any((bubble) =>
          (bubble.dx - newBubblePosition.dx).abs() < bubbleSize &&
          (bubble.dy - newBubblePosition.dy).abs() < bubbleSize));

      bubbles.add(newBubblePosition);
      bubbleNumbers.add(i);
      bubbleColors.add(colors[i - 1]);
    }
  }

  // Plays a random pop sound from the list
  Future<void> playPopSound() async {
    final soundPath = popSounds[random.nextInt(popSounds.length)];
    try {
      await audioPlayer.play(AssetSource(soundPath.replaceFirst('assets/', '')));
    } catch (e) {
      // Ignore any audio errors
    }
  }

  // Handles popping logic when a bubble is tapped
  void popBubble(int index) {
    if (bubbleNumbers[index] == nextNumberToPop) {
      playPopSound(); // Correct bubble
      setState(() {
        bubbles.removeAt(index);
        bubbleNumbers.removeAt(index);
        bubbleColors.removeAt(index);
        nextNumberToPop++;

        // All bubbles popped — reset the game
        if (bubbles.isEmpty) {
          resetGame();
        }
      });
    } else {
      // Show message if wrong bubble tapped
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please pop bubble number $nextNumberToPop')),
      );
    }
  }

  // Resets the game with a new bubble layout
  void resetGame() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double headerHeight = screenHeight * 0.18;
    final double footerHeight = screenHeight * 0.17;
    final double bubbleAreaHeight =
        screenHeight - headerHeight - footerHeight - screenHeight * 0.1;

    generateBubbles(screenWidth, bubbleAreaHeight);
    nextNumberToPop = 1;
    lastBubbleAreaWidth = screenWidth;
    lastBubbleAreaHeight = bubbleAreaHeight;
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Clean up audio player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double headerHeight = screenHeight * 0.18;
    final double footerHeight = screenHeight * 0.17;
    final double bubbleAreaHeight =
        screenHeight - headerHeight - footerHeight - screenHeight * 0.1;

    // Generate new bubbles if area changed or empty
    if (bubbles.isEmpty ||
        lastBubbleAreaWidth != screenWidth ||
        lastBubbleAreaHeight != bubbleAreaHeight) {
      generateBubbles(screenWidth, bubbleAreaHeight);
      lastBubbleAreaWidth = screenWidth;
      lastBubbleAreaHeight = bubbleAreaHeight;
      nextNumberToPop = 1;
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            SizedBox(height: headerHeight * 0.5),
            // Game header
            Container(
              height: headerHeight * 0.5,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.0001,
                horizontal: screenWidth * 0.05,
              ),
              child: const Center(
                child: Text(
                  'Pop the Bubbles\nin Order',
                  style: TextStyle(
                    color: Color(0xff0F073E),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Bubble area
            SizedBox(
              width: screenWidth,
              height: bubbleAreaHeight,
              child: Stack(
                children: bubbles.asMap().entries.map((entry) {
                  int index = entry.key;
                  Offset position = entry.value;
                  final double bubbleSize = screenWidth * 0.12;

                  return Positioned(
                    left: position.dx,
                    top: position.dy,
                    child: GestureDetector(
                      onTap: () => popBubble(index), // Handle bubble tap
                      child: CustomPaint(
                        size: Size(bubbleSize, bubbleSize),
                        painter: BubblePainter(
                          color: bubbleColors[index],
                          number: bubbleNumbers[index],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Footer with Next and Finish buttons
            Container(
              height: footerHeight,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinishScreen(startTime: DateTime.now()),
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FinishScreen(startTime: DateTime.now()),
                        ),
                      );
                    },
                    child: const Text(
                      'Finish Session',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for rendering each bubble
class BubblePainter extends CustomPainter {
  final Color color; // Bubble color
  final int number; // Number displayed in bubble

  BubblePainter({required this.color, required this.number});

  @override
  void paint(Canvas canvas, Size size) {
    final bubblePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment(-0.3, -0.3), // Gradient center for glossy effect
        radius: 0.8,
        colors: [
          color.withOpacity(0.97),
          color.withOpacity(0.72),
          Colors.white.withOpacity(0.33),
        ],
        stops: [0.13, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.22); // Highlight overlay

    // Draw main bubble with radial gradient
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, bubblePaint);
    // Draw top-left highlight
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.18, size.height * 0.15, size.width * 0.3, size.height * 0.22),
      highlightPaint,
    );
    // Draw inner bottom shine
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.58, size.height * 0.62, size.width * 0.18, size.height * 0.10),
      Paint()..color = Colors.white.withOpacity(0.12),
    );

    // Draw the bubble number at the center
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$number',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: size.width * 0.42,
          shadows: [
            Shadow(
              blurRadius: 6,
              color: Colors.black.withOpacity(0.20),
              offset: Offset(1, 2),
            )
          ],
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(BubblePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.number != number;
}