import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProductivityScorePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 6;

    // Background circle
    final bgPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final gradient = LinearGradient(
      colors: const [Color(0xFF1313EC), Color(0xFFE11D48)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2 * math.pi * 0.85; // 85%

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}