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
          style: TextButton.styleFrom(foregroundColor: Colors.grey[300]),
          child: Text(
            'Dismiss',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(width: 12),
        ElevatedButton(
          onPressed: onMerge,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(84, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
            shadowColor: const Color(0x801313EC),
          ),
          child: Text(
            'Merge Now',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
