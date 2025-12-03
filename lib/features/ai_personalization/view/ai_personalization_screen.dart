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
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'AI Personalization',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      drawer: CustomDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const Padding(
              padding: EdgeInsets.all(16),
              child: ProductivityScoreHero(),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
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
              padding: const EdgeInsets.all(16),
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
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Learn how your Productivity Score is calculated',
                  style: TextStyle(
                    color: Color(0xFF1313EC),
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