import 'package:flutter/material.dart';
import 'task_item.dart';

class TaskListCard extends StatelessWidget {
  final List<TaskItem> tasks;

  const TaskListCard({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: tasks),
      ),
    );
  }
}