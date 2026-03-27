import 'package:digital_twins/features/dashboard/widgets/ai_priority/ai_priority_card.dart';
import 'package:flutter/material.dart';
import 'package:digital_twins/shared/widgets/custom_drawer.dart';

import '../widgets/header/user_sync_indicator.dart';
import '../widgets/header/greeting_header.dart';
import '../widgets/productivity_boost/productivity_boost_card.dart';
import '../widgets/schedule/schedule_card.dart';
import '../widgets/schedule/schedule_item.dart';
import '../widgets/tasks/task_list_card.dart';
import '../widgets/tasks/task_item.dart';
import '../widgets/insights/insights_preview_card.dart';

class DigitalTwinsDashboard extends StatelessWidget {
  const DigitalTwinsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        elevation: 0,

        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        centerTitle: true,
        title: Text(
          'Digital Twins Sync',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),

      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ---- SYNC INDICATOR ----
                const UserSyncIndicator(syncText: 'Synced 2m ago'),
                SizedBox(height: 8),

                /// ---- GREETING ----
                const GreetingHeader(name: 'Alex'),
                SizedBox(height: 24),

                /// ---- AI PRIORITY ----
                const AiPriorityCard(
                  message:
                      "Focus on 'Project Phoenix' report now for maximum impact.",
                  subtitle:
                      "Completing this now will align with your Q3 goals.",
                ),
                SizedBox(height: 24),

                /// ---- PRODUCTIVITY BOOST ----
                const ProductivityBoostCard(
                  message:
                      "You have overlapping meetings. Merge 'Design Review' and '1-on-1' to save 30 minutes?",
                ),
                SizedBox(height: 24),

                /// ---- TODAY'S SCHEDULE ----
                Text(
                  "Today's Schedule",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 12),

                ScheduleCard(
                  items: const [
                    ScheduleItem(
                      time: '09:00',
                      ampm: 'AM',
                      title: 'Daily Standup',
                      subtitle: 'Project Hydra',
                      opacity: 1.0,
                    ),
                    ScheduleItem(
                      time: '11:00',
                      ampm: 'AM',
                      title: 'Design Review',
                      subtitle: 'Project Phoenix',
                      opacity: 1.0,
                    ),
                    ScheduleItem(
                      time: '02:00',
                      ampm: 'PM',
                      title: '1-on-1 with Sarah',
                      subtitle: 'Performance Sync',
                      opacity: 0.5,
                    ),
                  ],
                ),
                SizedBox(height: 24),

                /// ---- ACTIVE TASKS ----
                Text(
                  'Active Tasks',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 12),

                TaskListCard(
                  tasks: [
                    TaskItem(
                      checked: false,
                      title: 'Finalize slides for Design Review',
                      subtitle: 'Due Today',
                      onChanged: (_) {},
                    ),
                    TaskItem(
                      checked: false,
                      title: 'Draft Q4 marketing brief',
                      subtitle: 'Due Friday',
                      onChanged: (_) {},
                    ),
                    TaskItem(
                      checked: true,
                      title: 'Review team timesheets',
                      subtitle: 'Completed',
                      onChanged: (_) {},
                    ),
                  ],
                ),
                SizedBox(height: 24),

                /// ---- PRODUCTIVITY INSIGHTS PREVIEW ----
                Text(
                  'Productivity Insights',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 12),

                const InsightsPreviewCard(),
              ],
            ),
          ),
        ],
      ),

      /// FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSurface,
          size: 24,
        ),
      ),
    );
  }
}
