import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/task_model.dart';
import '../controllers/task_controller.dart';
import '../theme/app_theme.dart';

class TaskListItem extends StatelessWidget {
  final TaskModel task;

  const TaskListItem({required this.task, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    final isDeadlinePassed = task.deadline != null && task.deadline!.isBefore(DateTime.now()) && !task.isCompleted;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: task.isCompleted,
            activeColor: AppTheme.primaryAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onChanged: (_) {
              taskController.toggleTaskCompletion(task.id);
            },
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? AppTheme.textSecondary : AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                _buildChip(task.category, AppTheme.secondaryAccent),
                const SizedBox(width: 8),
                _buildChip(task.priority, _getPriorityColor(task.priority)),
              ],
            ),
            if (task.deadline != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 14,
                    color: isDeadlinePassed ? AppTheme.neonRed : AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('MMM d, h:mm a').format(task.deadline!),
                    style: TextStyle(
                      fontSize: 12,
                      color: isDeadlinePassed ? AppTheme.neonRed : AppTheme.textSecondary,
                      fontWeight: isDeadlinePassed ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: AppTheme.textSecondary),
          onPressed: () => taskController.deleteTask(task.id),
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return AppTheme.neonRed;
      case 'Medium':
        return Colors.orangeAccent;
      case 'Low':
      default:
        return AppTheme.neonGreen;
    }
  }
}
