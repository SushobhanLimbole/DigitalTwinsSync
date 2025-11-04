import 'package:digital_twins/features/ai_personalization/view/ai_personalization_screen.dart';
import 'package:digital_twins/features/automation/view/automation_screen.dart';
import 'package:digital_twins/features/insights/view/productivity_insights_screen.dart';
import 'package:digital_twins/features/profile/view/profile_screen.dart';
import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DigitalTwinsDashboard extends StatelessWidget {
  const DigitalTwinsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF101022).withOpacity(0.8),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF101022).withOpacity(0.8),
          ),
        ),
        // Provide an explicit leading menu button so the Drawer can be opened.
        // A Builder is used so we get a context that's a descendant of the Scaffold
        // and can call Scaffold.of(context).openDrawer().
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          'Digital Twins Sync',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015 * 18 / 1000,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 24,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                      height: 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Synced 2m ago',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'Good Morning, Alex',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.015 * 32 / 1000,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SectionHeader('AI Priority'),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x991C1C27),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Focus on 'Project Phoenix' report now for maximum impact.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.015 * 18 / 1000,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'AI Suggestion',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Completing this now will align with your Q3 goals.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1313EC),
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(84, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                  shadowColor: Color(0x801313EC),
                                ),
                                child: const Text(
                                  'View Details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SectionHeader('Productivity Boost'),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [const Color(0x331313EC), Colors.transparent],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0x801313EC)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x331313EC),
                        blurRadius: 30,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: const Color(0x4D1313EC),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.auto_awesome,
                                color: Color(0xFF1313EC),
                                size: 20,
                                fill:
                                    1.0, // Note: fill is not standard; use IconData with filled variant if available
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'You have overlapping meetings. Merge \'Design Review\' and \'1-on-1\' to save 30 minutes?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[300],
                              ),
                              child: const Text(
                                'Dismiss',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1313EC),
                                foregroundColor: Colors.white,
                                minimumSize: Size(84, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                                shadowColor: Color(0x801313EC),
                              ),
                              child: const Text(
                                'Merge Now',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SectionHeader("Today's Schedule"),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x991C1C27),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _ScheduleItem(
                          time: '09:00',
                          ampm: 'AM',
                          title: 'Daily Standup',
                          subtitle: 'Project Hydra',
                          opacity: 1.0,
                        ),
                        _ScheduleItem(
                          time: '11:00',
                          ampm: 'AM',
                          title: 'Design Review',
                          subtitle: 'Project Phoenix',
                          opacity: 1.0,
                        ),
                        _ScheduleItem(
                          time: '02:00',
                          ampm: 'PM',
                          title: '1-on-1 with Sarah',
                          subtitle: 'Performance Sync',
                          opacity: 0.5,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SectionHeader('Active Tasks'),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x991C1C27),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _TaskItem(
                          checked: false,
                          title: 'Finalize slides for Design Review',
                          subtitle: 'Due Today',
                        ),
                        _TaskItem(
                          checked: false,
                          title: 'Draft Q4 marketing brief',
                          subtitle: 'Due Friday',
                        ),
                        _TaskItem(
                          checked: true,
                          title: 'Review team timesheets',
                          subtitle: 'Completed',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SectionHeader('Productivity Insights'),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x991C1C27),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        _ProgressRing(),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _StatCard(
                                value: '4h',
                                label: 'Focus Time',
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _StatCard(
                                value: '8/10',
                                label: 'Productivity Score',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1313EC),
        elevation: 8,
        child: const Icon(Icons.add, size: 24, color: Colors.white),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.015 * 22 / 1000,
        color: Colors.white,
      ),
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final String time;
  final String ampm;
  final String title;
  final String subtitle;
  final double opacity;

  const _ScheduleItem({
    required this.time,
    required this.ampm,
    required this.title,
    required this.subtitle,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1313EC),
                    fontSize: 16,
                  ),
                ),
                Text(ampm, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(width: 16),
            Container(width: 1, height: 40, color: const Color(0xFF334155)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final bool checked;
  final String title;
  final String subtitle;

  const _TaskItem({
    required this.checked,
    required this.title,
    required this.subtitle,
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
            onChanged: (_) {},
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

class _ProgressRing extends StatelessWidget {
  const _ProgressRing();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 160,
          height: 160,
          child: CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 3,
            backgroundColor: const Color(0xFF334155),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
          ),
        ),
        SizedBox(
          width: 160,
          height: 160,
          child: CircularProgressIndicator(
            value: 0.75,
            strokeWidth: 3,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1313EC)),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              '75%',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Task Completion',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0x802A2D3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
