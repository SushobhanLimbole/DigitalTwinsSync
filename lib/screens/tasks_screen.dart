import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../widgets/task_list_item.dart';
import '../widgets/add_task_dialog.dart';
import '../theme/app_theme.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tasks'),
      ),
      body: Obx(() {
        final tasks = taskController.tasks;
        if (tasks.isEmpty) {
          return Center(
            child: Text(
              'No tasks available. Add some!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
        
        // Split into pending and completed
        final pending = tasks.where((t) => !t.isCompleted).toList();
        final completed = tasks.where((t) => t.isCompleted).toList();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (pending.isNotEmpty) ...[
              Text(
                'Pending',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              ...pending.map((t) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TaskListItem(task: t),
                  )),
              const SizedBox(height: 24),
            ],
            if (completed.isNotEmpty) ...[
              Text(
                'Completed',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              ...completed.map((t) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Opacity(
                      opacity: 0.6,
                      child: TaskListItem(task: t),
                    ),
                  )),
            ],
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddTaskDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
