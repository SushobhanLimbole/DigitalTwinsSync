import 'package:flutter/material.dart';

class AiPriorityButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AiPriorityButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1313EC),
        foregroundColor: Colors.white,
        minimumSize: const Size(84, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        shadowColor: const Color(0x801313EC),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}