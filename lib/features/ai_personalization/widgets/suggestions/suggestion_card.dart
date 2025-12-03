import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  final String subtitle;
  final String title;
  final String description;
  final String primaryAction;
  final IconData? primaryIcon;
  final VoidCallback onPrimaryPressed;

  const SuggestionCard({
    super.key,
    required this.subtitle,
    required this.title,
    required this.description,
    required this.primaryAction,
    this.primaryIcon,
    required this.onPrimaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015 * 18 / 1000,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 16,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Dismiss',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: onPrimaryPressed,
          icon: primaryIcon != null ? Icon(primaryIcon, size: 16) : null,
          label: Text(primaryAction),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1313EC),
            foregroundColor: Colors.white,
            minimumSize: const Size(84, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}