import 'package:flutter/material.dart';

class GreetingHeader extends StatelessWidget {
  final String name;

  const GreetingHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Good Morning, $name',
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.015 * 32 / 1000,
        color: Colors.white,
      ),
    );
  }
}