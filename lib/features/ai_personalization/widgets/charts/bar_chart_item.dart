import 'package:flutter/material.dart';

class BarChartItem extends StatelessWidget {
  final double heightFraction;
  final String label;

  const BarChartItem({
    super.key,
    required this.heightFraction,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xFF1313EC).withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Container(
                height: heightFraction * 140,
                decoration: const BoxDecoration(
                  color: Color(0xFF1313EC),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}