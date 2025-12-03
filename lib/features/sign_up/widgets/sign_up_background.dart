import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  const SignUpBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.black),
        Positioned(
          top: -300,
          left: -300,
          child: _circle(),
        ),
        Positioned(
          bottom: -300,
          right: -300,
          child: _circle(),
        ),
      ],
    );
  }

  Widget _circle() {
    return Container(
      width: 600,
      height: 600,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Color(0x4D7C3AED), Colors.transparent],
          stops: [0.0, 0.6],
        ),
      ),
    );
  }
}