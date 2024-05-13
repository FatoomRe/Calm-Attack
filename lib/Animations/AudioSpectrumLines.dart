import 'package:flutter/material.dart';


class AudioSpectrumLines extends StatelessWidget {
  const AudioSpectrumLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate( 6, (index) => Container(
        height: 30,
        width: 5,
        color: const Color(0xff0F073E),
      ),),
    );
  }
}
