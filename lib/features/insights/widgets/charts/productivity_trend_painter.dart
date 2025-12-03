import 'package:flutter/material.dart';

class ProductivityTrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height - 40)
      ..lineTo(18.15, size.height - 128)
      ..lineTo(36.31, size.height - 128)
      ..lineTo(54.46, size.height - 108)
      ..lineTo(72.62, size.height - 56)
      ..lineTo(90.77, size.height - 56)
      ..lineTo(108.92, size.height - 116)
      ..lineTo(127.08, size.height - 116)
      ..lineTo(145.23, size.height - 76)
      ..lineTo(163.38, size.height - 48)
      ..lineTo(181.54, size.height - 48)
      ..lineTo(199.69, size.height - 88)
      ..lineTo(217.85, size.height - 104)
      ..lineTo(236, size.height - 104)
      ..lineTo(254.15, size.height - 28)
      ..lineTo(size.width, size.height - 124)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // Gradient fill
    final gradient = LinearGradient(
      colors: [
        const Color(0xFF39FF14).withOpacity(0.3),
        const Color(0xFF39FF14).withOpacity(0),
      ],
    );

    final fillPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    canvas.drawPath(path, fillPaint);

    // Line stroke
    final linePaint = Paint()
      ..color = const Color(0xFF39FF14)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final linePath = Path()
      ..moveTo(0, size.height - 40)
      ..lineTo(18.15, size.height - 128)
      ..lineTo(36.31, size.height - 128)
      ..lineTo(54.46, size.height - 108)
      ..lineTo(72.62, size.height - 56)
      ..lineTo(90.77, size.height - 56)
      ..lineTo(108.92, size.height - 116)
      ..lineTo(127.08, size.height - 116)
      ..lineTo(145.23, size.height - 76)
      ..lineTo(163.38, size.height - 48)
      ..lineTo(181.54, size.height - 48)
      ..lineTo(199.69, size.height - 88)
      ..lineTo(217.85, size.height - 104)
      ..lineTo(236, size.height - 104)
      ..lineTo(254.15, size.height - 28)
      ..lineTo(size.width, size.height - 124);

    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}