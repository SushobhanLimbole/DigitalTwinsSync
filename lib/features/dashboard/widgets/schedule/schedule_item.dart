import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  final String time;
  final String ampm;
  final String title;
  final String subtitle;
  final double opacity;

  const ScheduleItem({
    super.key,
    required this.time,
    required this.ampm,
    required this.title,
    required this.subtitle,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1313EC),
                    fontSize: 16,
                  ),
                ),
                Text(
                  ampm,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Container(width: 1, height: 40, color: Color(0xFF334155)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}