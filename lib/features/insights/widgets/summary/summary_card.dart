import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const SummaryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF39FF14), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}