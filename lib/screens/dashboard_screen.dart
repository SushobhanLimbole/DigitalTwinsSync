import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/task_controller.dart';
import '../controllers/digital_twin_controller.dart';
import '../widgets/task_list_item.dart';
import '../theme/app_theme.dart';
import '../services/email_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    final twinController = Get.find<DigitalTwinController>();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Good Morning, User',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              DateFormat('EEEE, MMMM d').format(DateTime.now()),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        toolbarHeight: 80,
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Sync Emails',
            onPressed: () async {
              Get.dialog(
                const Center(child: CircularProgressIndicator()),
                barrierDismissible: false,
              );
              try {
                final newTasks = await EmailSyncService.syncEmails();
                Get.back();
                if (newTasks.isEmpty) {
                  Get.snackbar('Email Sync', 'No new important tasks found.', 
                    snackPosition: SnackPosition.BOTTOM);
                } else {
                  for (var t in newTasks) {
                    await taskController.addTask(t);
                  }
                  Get.snackbar('Email Sync', 'Added ${newTasks.length} tasks from emails!', 
                    snackPosition: SnackPosition.BOTTOM);
                }
              } catch (e) {
                Get.back();
                Get.snackbar('Sync Error', 'Ensure backend is running. Error: $e', 
                  snackPosition: SnackPosition.BOTTOM, 
                  backgroundColor: Colors.redAccent, 
                  colorText: Colors.white);
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductivityCard(twinController),
                  const SizedBox(height: 24),
                  _buildSuggestionsSection(twinController),
                  const SizedBox(height: 24),
                  Text(
                    "Today's Focus",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Obx(() {
            final todayTasks = taskController.todayTasks;
            if (todayTasks.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      'No tasks for today. Enjoy your day or add some new tasks!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: TaskListItem(task: todayTasks[index]),
                  );
                },
                childCount: todayTasks.length,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildProductivityCard(DigitalTwinController controller) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryAccent.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Obx(() {
        final profile = controller.userProfile.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Productivity Score',
                  style: Get.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${profile.productivityScore.toStringAsFixed(0)}%',
                  style: Get.textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${profile.totalTasksCompleted} of ${profile.totalTasksCreated} Tasks Completed',
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: profile.totalTasksCreated == 0 
                        ? 0 
                        : profile.productivityScore / 100,
                    strokeWidth: 8,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  Center(
                    child: Icon(
                      Icons.insights_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildSuggestionsSection(DigitalTwinController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.psychology, color: AppTheme.secondaryAccent),
            const SizedBox(width: 8),
            Text(
              'Digital Twin Insights',
              style: Get.textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Obx(() {
          final suggestions = controller.suggestions;
          return Column(
            children: suggestions.map((s) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              color: AppTheme.cardColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: s.id.contains('warning') 
                      ? AppTheme.neonRed.withOpacity(0.3) 
                      : s.id.contains('success') || s.id.contains('high')
                          ? AppTheme.neonGreen.withOpacity(0.3)
                          : AppTheme.primaryAccent.withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  s.id.contains('warning') ? Icons.warning_amber_rounded
                  : s.id.contains('success') ? Icons.check_circle_outline
                  : Icons.lightbulb_outline,
                  color: s.id.contains('warning') ? AppTheme.neonRed
                  : s.id.contains('success') ? AppTheme.neonGreen
                  : AppTheme.primaryAccent,
                ),
                title: Text(s.message, style: Get.textTheme.bodyMedium),
              ),
            )).toList(),
          );
        }),
      ],
    );
  }
}
