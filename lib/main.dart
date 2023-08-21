import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color.fromARGB(255, 38, 59, 173), Color(0xff00c4b2)],
          stops: [0.3, 2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      ),
    ),
  ));
}

