import 'package:flutter/material.dart';
import 'package:digital_twins/shared/widgets/custom_drawer.dart';

import '../widgets/hero/productivity_score_hero.dart';
import '../widgets/charts/weekly_focus_chart.dart';
import '../widgets/suggestions/suggestion_card.dart';

class AIPersonalizationScreen extends StatefulWidget {
  const AIPersonalizationScreen({super.key});

  @override
  State<AIPersonalizationScreen> createState() =>
      _AIPersonalizationScreenState();
}

class _AIPersonalizationScreenState extends State<AIPersonalizationScreen> {
  int _selectedSegment = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'AI Personalization',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      drawer: CustomDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: ProductivityScoreHero(),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: WeeklyFocusChart(
                selectedSegment: _selectedSegment,
                onSegmentChanged: (value) {
                  setState(() {
                    _selectedSegment = value;
                  });
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SuggestionCard(
                    subtitle: 'Suggestion: Optimize Your Morning',
                    title: 'Task Optimization',
                    description:
                        "Reschedule 'Project Alpha Sync' to your peak productivity time at 10 AM for better focus.",
                    primaryAction: 'Accept',
                    onPrimaryPressed: () {},
                  ),

                  SuggestionCard(
                    subtitle: 'New Smart Reminder',
                    title: 'Smart Reminders',
                    description:
                        "Set a reminder to 'Review Q3 Deck' 1 hour before your meeting with Marketing.",
                    primaryAction: 'Set Reminder',
                    primaryIcon: Icons.add,
                    onPrimaryPressed: () {},
                  ),

                  SuggestionCard(
                    subtitle: 'Automate This?',
                    title: 'Automated Actions',
                    description:
                        "Automatically silence notifications from social media apps during your scheduled focus blocks.",
                    primaryAction: 'Enable Rule',
                    onPrimaryPressed: () {},
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 32),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Learn how your Productivity Score is calculated',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
