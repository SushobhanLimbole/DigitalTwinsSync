import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/search/search_bar.dart';
import '../widgets/card/automation_card.dart';
import '../widgets/card/empty_state_card.dart';

class AutomationsScreen extends StatelessWidget {
  const AutomationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF101022)),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: const Color(0xFF101022),
              surfaceTintColor: Colors.transparent,
              foregroundColor: const Color(0xFFEAEAEA),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
              title: const Text(
                'Automations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: -0.015 * 18 / 1000,
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 32),
                    style: IconButton.styleFrom(backgroundColor: Colors.transparent),
                  ),
                ),
              ],
            ),

            // Search bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: CustomSearchBar(),
              ),
            ),

            // Automation list
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  AutomationCard(
                    icon: Icons.notifications_active,
                    title: 'Daily Stand-up Reminder',
                    subtitle: 'Notifies team in #general 10m before stand-up.',
                    isEnabled: true,
                    footerIcon: Icons.schedule,
                    footerText: 'Daily at 9:50 AM',
                  ),
                  AutomationCard(
                    icon: Icons.forward_to_inbox,
                    title: 'Client Follow-up',
                    subtitle: 'Drafts a follow-up email if no reply in 3 days.',
                    isEnabled: true,
                    footerIcon: Icons.bar_chart,
                    footerText: 'Fired 3 times last week',
                  ),
                  AutomationCard(
                    icon: Icons.summarize,
                    title: 'Weekly Productivity Report',
                    subtitle: 'Summarizes completed tasks and sends to my inbox.',
                    isEnabled: false,
                    showProgress: true,
                    progressValue: 0.45,
                    footerText: 'Next report in 4 days',
                  ),

                  // Empty / CTA card
                  const SizedBox(height: 8),
                  const EmptyStateCard(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}