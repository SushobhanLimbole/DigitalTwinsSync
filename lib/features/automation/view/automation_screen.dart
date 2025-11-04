import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class AutomationsScreen extends StatelessWidget {
  const AutomationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF101022)),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Color(0xFF101022),
              surfaceTintColor: Colors.transparent,
              foregroundColor: Color(0xFFEAEAEA),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  tooltip: MaterialLocalizations.of(
                    context,
                  ).openAppDrawerTooltip,
                ),
              ),
              title: Text(
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
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search automations...',
                    hintStyle: TextStyle(
                      color: const Color(0xFF8A8D98),
                      fontSize: 16,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search,
                        color: const Color(0xFF8A8D98),
                        size: 24,
                      ),
                    ),
                    filled: true,
                    // fillColor: const Color(0xFF252836),
                    fillColor: const Color(0x991C1C27),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF00FFFF)),
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFFEAEAEA),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _AutomationCard(
                    icon: Icons.notifications_active,
                    title: 'Daily Stand-up Reminder',
                    subtitle: 'Notifies team in #general 10m before stand-up.',
                    isEnabled: true,
                    footerIcon: Icons.schedule,
                    footerText: 'Daily at 9:50 AM',
                  ),
                  _AutomationCard(
                    icon: Icons.forward_to_inbox,
                    title: 'Client Follow-up',
                    subtitle: 'Drafts a follow-up email if no reply in 3 days.',
                    isEnabled: true,
                    footerIcon: Icons.bar_chart,
                    footerText: 'Fired 3 times last week',
                  ),
                  _AutomationCard(
                    icon: Icons.summarize,
                    title: 'Weekly Productivity Report',
                    subtitle:
                        'Summarizes completed tasks and sends to my inbox.',
                    isEnabled: false,
                    showProgress: true,
                    progressValue: 0.45,
                    footerText: 'Next report in 4 days',
                  ),
                  Container(
                    padding: const EdgeInsets.all(32),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0x991C1C27),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.rocket_launch,
                          size: 64,
                          color: const Color(0xFF8A8D98),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Automate Your Workflow',
                          style: TextStyle(
                            color: Color(0xFFEAEAEA),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "You don't have any other automations. Create your first one to boost your productivity.",
                          style: TextStyle(
                            color: Color(0xFF8A8D98),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 20),
                          label: const Text('Create Automation'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00FFFF),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AutomationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isEnabled;
  final IconData? footerIcon;
  final String? footerText;
  final bool showProgress;
  final double? progressValue;

  const _AutomationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isEnabled,
    this.footerIcon,
    this.footerText,
    this.showProgress = false,
    this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0x1A00FFFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: const Color(0xFF00FFFF), size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFFEAEAEA),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF8A8D98),
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Switch(
                value: isEnabled,
                onChanged: (_) {},
                activeColor: const Color(0xFF00FFFF),
                activeTrackColor: const Color(0x1A00FFFF),
                inactiveThumbColor: Colors.white.withOpacity(0.5),
                inactiveTrackColor: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          if (footerIcon != null || footerText != null || showProgress)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  if (!showProgress)
                    Row(
                      children: [
                        Icon(
                          footerIcon!,
                          color: const Color(0xFF8A8D98),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          footerText ?? '',
                          style: const TextStyle(
                            color: Color(0xFF8A8D98),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  else ...[
                    Text(
                      footerText ?? '',
                      style: const TextStyle(
                        color: Color(0xFF8A8D98),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: Colors.black.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF00FFFF),
                      ),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}
