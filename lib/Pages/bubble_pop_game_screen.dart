
import 'package:calmattack/Pages/finish_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart'; // <-- Add this import

class BubblePopGameScreen extends StatefulWidget {
  const BubblePopGameScreen({super.key});

  @override
  _BubblePopGameScreenState createState() => _BubblePopGameScreenState();
}

class _BubblePopGameScreenState extends State<BubblePopGameScreen> {
  List<Offset> bubbles = [];
  List<int> bubbleNumbers = [];
  List<Color> bubbleColors = [];
  int nextNumberToPop = 1;
  Random random = Random();

  double? lastBubbleAreaWidth;
  double? lastBubbleAreaHeight;

  static const int totalBubbles = 20;
  final List<String> popSounds = [
    'assets/pop1.mp3',
    'assets/pop2.mp3',
    'assets/pop3.mp3',
  ];
  final AudioPlayer audioPlayer = AudioPlayer();

  // Generate a list of 20 unique vivid colors
  List<Color> generateUniqueVividColors(int count) {
    // Spread hues evenly around the color wheel
    return List.generate(count, (i) {
      double hue = (i * (360.0 / count)) % 360;
      return HSVColor.fromAHSV(1.0, hue, 0.95, 0.95).toColor();
    })..shuffle(random);
  }

  void generateBubbles(double bubbleAreaWidth, double bubbleAreaHeight) {
    final double bubbleSize = bubbleAreaWidth * 0.12;

    bubbles.clear();
    bubbleNumbers.clear();
    bubbleColors.clear();

    // Get unique vivid colors (shuffled for randomness)
    final colors = generateUniqueVividColors(totalBubbles);

    for (int i = 1; i <= totalBubbles; i++) {
      Offset newBubblePosition;

      int tries = 0;
      do {
        newBubblePosition = Offset(
          random.nextDouble() * (bubbleAreaWidth - bubbleSize),
          random.nextDouble() * (bubbleAreaHeight - bubbleSize),
        );
        tries++;
        if (tries > 1000) break;
      } while (bubbles.any((bubble) =>
          (bubble.dx - newBubblePosition.dx).abs() < bubbleSize &&
          (bubble.dy - newBubblePosition.dy).abs() < bubbleSize));

      bubbles.add(newBubblePosition);
      bubbleNumbers.add(i);
      bubbleColors.add(colors[i - 1]);
    }
  }

  Future<void> playPopSound() async {
    // Pick a random pop sound from the list
    final soundPath = popSounds[random.nextInt(popSounds.length)];
    try {
      await audioPlayer.play(AssetSource(soundPath.replaceFirst('assets/', '')));
    } catch (e) {
      // ignore sound errors
    }
  }

  void popBubble(int index) {
    if (bubbleNumbers[index] == nextNumberToPop) {
      playPopSound(); // Play sound on correct pop
      setState(() {
        bubbles.removeAt(index);
        bubbleNumbers.removeAt(index);
        bubbleColors.removeAt(index);
        nextNumberToPop++;

        // If all bubbles are popped, reset the game!
        if (bubbles.isEmpty) {
          resetGame();
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please pop bubble number $nextNumberToPop')),
      );
    }
  }

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
    audioPlayer.dispose();
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
                      onTap: () => popBubble(index),
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

class BubblePainter extends CustomPainter {
  final Color color;
  final int number;

  BubblePainter({required this.color, required this.number});

  @override
  void paint(Canvas canvas, Size size) {
    final bubblePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment(-0.3, -0.3),
        radius: 0.8,
        colors: [
          color.withOpacity(0.97),
          color.withOpacity(0.72),
          Colors.white.withOpacity(0.33),
        ],
        stops: [0.13, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

    final highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.22);

    // Draw main bubble
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, bubblePaint);
    // Draw highlight (top left)
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.18, size.height * 0.15, size.width * 0.3, size.height * 0.22),
      highlightPaint,
    );
    // Draw inner shine
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.58, size.height * 0.62, size.width * 0.18, size.height * 0.10),
      Paint()..color = Colors.white.withOpacity(0.12),
    );
    // Draw the number
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