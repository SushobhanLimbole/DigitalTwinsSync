import 'package:flutter/material.dart';

class ProgressRing extends StatelessWidget {
  final double progress; // 0.0 → 1.0
  final String label;

  const ProgressRing({
    super.key,
    required this.progress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 160,
          height: 160,
          child: CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 3,
            backgroundColor: const Color(0xFF334155),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.transparent),
          ),
        ),
        SizedBox(
          width: 160,
          height: 160,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 3,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1313EC)),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}