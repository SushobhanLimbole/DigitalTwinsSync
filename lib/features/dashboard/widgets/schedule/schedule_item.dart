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
        padding: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                Text(ampm, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            SizedBox(width: 16),
            Container(width: 1, height: 40, color: Color(0xFF334155)),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
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
