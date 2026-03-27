import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/digital_twin_controller.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final twinController = Get.find<DigitalTwinController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Twin Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppTheme.primaryAccent,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'User Model v1.0',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Your behavioral digital twin is learning.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Card(
              child: Obx(() {
                final profile = twinController.userProfile.value;
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.score, color: AppTheme.primaryAccent),
                      title: const Text('Lifetime Score'),
                      trailing: Text('${profile.productivityScore.toStringAsFixed(1)}%'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.category, color: AppTheme.secondaryAccent),
                      title: const Text('Top Category'),
                      trailing: Text(_getTopCategory(profile.tasksByCategory)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.timelapse, color: AppTheme.neonGreen),
                      title: const Text('Peak Time'),
                      trailing: Text(profile.mostActiveHour),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  String _getTopCategory(Map<String, int> categories) {
    if (categories.isEmpty) return 'N/A';
    var top = categories.entries.reduce((a, b) => a.value > b.value ? a : b);
    return top.key;
  }
}
