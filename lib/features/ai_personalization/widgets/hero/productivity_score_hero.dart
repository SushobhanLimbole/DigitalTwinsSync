import 'package:flutter/material.dart';
import 'productivity_score_painter.dart';

class ProductivityScoreHero extends StatelessWidget {
  const ProductivityScoreHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: const Color(0x991C1C27),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CustomPaint(
            painter: ProductivityScorePainter(),
          ),
        ),

        /// Text Overlay
        Column(
          children: const [
            Text(
              'Productivity Score',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '85',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Excellent',
              style: TextStyle(
                color: Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}