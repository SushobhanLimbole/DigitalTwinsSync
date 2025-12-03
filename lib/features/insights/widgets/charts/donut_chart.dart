import 'package:flutter/material.dart';
import 'donut_chart_painter.dart';

class DonutChart extends StatelessWidget {
  const DonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(140, 140),
          painter: DonutChartPainter(),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Time',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              '48h 15m',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}