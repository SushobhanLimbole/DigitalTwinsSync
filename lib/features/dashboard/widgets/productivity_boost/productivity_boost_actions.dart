import 'package:flutter/material.dart';

class ProductivityBoostActions extends StatelessWidget {
  final VoidCallback onDismiss;
  final VoidCallback onMerge;

  const ProductivityBoostActions({
    super.key,
    required this.onDismiss,
    required this.onMerge,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onDismiss,
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey[300],
          ),
          child: const Text(
            'Dismiss',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: onMerge,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1313EC),
            foregroundColor: Colors.white,
            minimumSize: const Size(84, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
            shadowColor: const Color(0x801313EC),
          ),
          child: const Text(
            'Merge Now',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}