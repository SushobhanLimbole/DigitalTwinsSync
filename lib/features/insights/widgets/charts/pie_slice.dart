import 'package:flutter/material.dart';

class PieSlice extends StatelessWidget {
  final String label;
  final double percentage;
  final Color color;

  const PieSlice(this.label, this.percentage, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Text(
          '$percentage%',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}