import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0xFF101022)),
        _blurCircle(
          context,
          top: -0.25,
          left: -0.25,
          color: Colors.cyan.withOpacity(0.1),
        ),
        _blurCircle(
          context,
          bottom: -0.25,
          right: -0.25,
          color: Colors.purple.withOpacity(0.1),
        ),
      ],
    );
  }

  Positioned _blurCircle(
    BuildContext context, {
    double? top,
    double? bottom,
    double? left,
    double? right,
    required Color color,
  }) {
    return Positioned(
      top: top != null ? MediaQuery.of(context).size.height * top : null,
      bottom: bottom != null ? MediaQuery.of(context).size.height * bottom : null,
      left: left != null ? MediaQuery.of(context).size.width * left : null,
      right: right != null ? MediaQuery.of(context).size.width * right : null,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const SizedBox(),
        ),
      ),
    );
  }
}