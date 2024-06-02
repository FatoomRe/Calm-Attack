// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:async';

class BreathingCloud extends StatefulWidget {
  final Function(String) callback;

  const BreathingCloud({super.key, required this.callback});


  @override
  
  // ignore: library_private_types_in_public_api
  _BreathingCloudState createState() => _BreathingCloudState();
}

class _BreathingCloudState extends State<BreathingCloud>
 with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  String _imagePath = 'assets/INHALE.png';
  

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween(begin: 50.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );


     _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _imagePath = 'assets/HOLD.png';
          widget.callback('HOLD');
        });
        Timer(const Duration(seconds: 3), () {
          setState(() {
            _imagePath = 'assets/EXHALE.png';
            widget.callback('EXHALE');
          });
          _controller.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _imagePath = 'assets/INHALE.png';
          widget.callback('INHALE');
        });
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          // ignore: sized_box_for_whitespace
          child: Container(
            width: _animation.value,
            child: Image.asset(_imagePath, width: 2.0, height: 2.0),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

