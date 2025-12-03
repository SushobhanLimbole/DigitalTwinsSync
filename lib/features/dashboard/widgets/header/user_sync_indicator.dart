import 'package:flutter/material.dart';

class UserSyncIndicator extends StatelessWidget {
  final String syncText;

  const UserSyncIndicator({
    super.key,
    required this.syncText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          syncText,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}