import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final bool checked;
  final String title;
  final String subtitle;
  final ValueChanged<bool?>? onChanged;

  const TaskItem({
    super.key,
    required this.checked,
    required this.title,
    required this.subtitle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = checked ? Colors.grey[500] : Colors.white;
    final decoration = checked ? TextDecoration.lineThrough : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: onChanged,
            activeColor: const Color(0xFF1313EC),
            checkColor: Colors.white,
            side: const BorderSide(color: Color(0xFF475569)),
            shape: const CircleBorder(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: textColor,
                    decoration: decoration,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}