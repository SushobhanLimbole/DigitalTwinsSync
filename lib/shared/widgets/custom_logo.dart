import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(64, 64), painter: LogoPainter());
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;

    final outerPaint = Paint()
      ..color = Colors.cyan.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, outerPaint);

    final gradient = RadialGradient(colors: [Colors.cyan, Colors.purple]);
    final innerPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius * 0.6),
      )
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.6, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}