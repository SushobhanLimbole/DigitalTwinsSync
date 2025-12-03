import 'dart:math' as math;
import 'package:flutter/material.dart';

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 7;

    // Project A - 60%
    final paintA = Paint()
      ..color = const Color(0xFF00BFFF)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      1.8 * math.pi,
      false,
      paintA,
    );

    // Meetings - 30%
    final paintB = Paint()
      ..color = const Color(0xFFFF00FF)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + 1.8 * math.pi,
      0.9 * math.pi,
      false,
      paintB,
    );

    // Admin - 10%
    final paintC = Paint()
      ..color = const Color(0xFF39FF14)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + 2.7 * math.pi,
      0.3 * math.pi,
      false,
      paintC,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}