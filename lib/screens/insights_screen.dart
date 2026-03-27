import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/digital_twin_controller.dart';
import '../theme/app_theme.dart';
// In a real app we would use fl_chart here to draw actual bar carts. 
// For this demo boilerplate, we will create visual placeholders simulating fl_chart behavior.

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final twinController = Get.find<DigitalTwinController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics & Insights'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final profile = twinController.userProfile.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weekly Summary',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatColumn('Completed', profile.totalTasksCompleted.toString(), AppTheme.neonGreen),
                          _buildStatColumn('Delayed', profile.tasksDelayed.toString(), AppTheme.neonRed),
                          _buildStatColumn('Total', profile.totalTasksCreated.toString(), AppTheme.primaryAccent),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Divider(color: Colors.white.withOpacity(0.1)),
                      const SizedBox(height: 16),
                      Text(
                        'Your productivity increased by 15% this week!',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.neonGreen,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Most Active Hours',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.access_time_rounded, size: 48, color: AppTheme.secondaryAccent),
                        const SizedBox(height: 12),
                        Text(
                          profile.mostActiveHour,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 28),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This is when you complete the most tasks.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: Get.textTheme.displaySmall?.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Get.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
