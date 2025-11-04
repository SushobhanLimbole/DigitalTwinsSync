import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this package to pubspec.yaml for Space Grotesk
import 'dart:math' as math;

class AIPersonalizationScreen extends StatefulWidget {
  const AIPersonalizationScreen({super.key});

  @override
  State<AIPersonalizationScreen> createState() =>
      _AIPersonalizationScreenState();
}

class _AIPersonalizationScreenState extends State<AIPersonalizationScreen> {
  int _selectedSegment = 1; // 0: Day, 1: Week, 2: Month

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: const Text(
          'AI Personalization',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015 * 18 / 1000,
          ),
        ),
        // actions: const [
        //   Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.settings)),
        //   SizedBox(width: 4),
        // ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Productivity Score Hero
            Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0x991C1C27),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CustomPaint(
                      size: Size(double.infinity, double.infinity),
                      painter: ProductivityScorePainter(),
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Productivity Score',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '85',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Excellent',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Data Visualization Chart
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Weekly Focus Pattern',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x991C1C27),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '42 hours',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'This Week',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '+15%',
                                        style: TextStyle(
                                          color: Color(0xFF0BDA68),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SegmentedButton<int>(
                                    segments: const [
                                      ButtonSegment(
                                        value: 0,
                                        label: Text('Day'),
                                      ),
                                      ButtonSegment(
                                        value: 1,
                                        label: Text('Week'),
                                      ),
                                      ButtonSegment(
                                        value: 2,
                                        label: Text('Month'),
                                      ),
                                    ],
                                    selected: {_selectedSegment},
                                    onSelectionChanged: (Set<int> selection) {
                                      setState(() {
                                        _selectedSegment = selection.first;
                                      });
                                    },
                                    style: SegmentedButton.styleFrom(
                                      selectedBackgroundColor:
                                          Colors.transparent,
                                      selectedForegroundColor: Colors.white,
                                      disabledBackgroundColor:
                                          Colors.transparent,
                                      disabledForegroundColor: Colors.grey,
                                      visualDensity: VisualDensity.compact,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _BarChartItem(
                                  heightFraction: 0.70,
                                  label: 'Mon',
                                ),
                                _BarChartItem(
                                  heightFraction: 0.40,
                                  label: 'Tue',
                                ),
                                _BarChartItem(
                                  heightFraction: 0.70,
                                  label: 'Wed',
                                ),
                                _BarChartItem(
                                  heightFraction: 0.60,
                                  label: 'Thu',
                                ),
                                _BarChartItem(
                                  heightFraction: 0.40,
                                  label: 'Fri',
                                ),
                                _BarChartItem(
                                  heightFraction: 0.80,
                                  label: 'Sat',
                                ),
                                _BarChartItem(
                                  heightFraction: 0.90,
                                  label: 'Sun',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Interactive Cards Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _SuggestionCard(
                    subtitle: 'Suggestion: Optimize Your Morning',
                    title: 'Task Optimization',
                    description:
                        "Reschedule 'Project Alpha Sync' to your peak productivity time at 10 AM for better focus.",
                    primaryAction: 'Accept',
                    onPrimaryPressed: () {},
                  ),
                  _SuggestionCard(
                    subtitle: 'New Smart Reminder',
                    title: 'Smart Reminders',
                    description:
                        "Set a reminder to 'Review Q3 Deck' 1 hour before your meeting with Marketing.",
                    primaryAction: 'Set Reminder',
                    primaryIcon: Icons.add,
                    onPrimaryPressed: () {},
                  ),
                  _SuggestionCard(
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
            // Learn More Link
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

class ProductivityScorePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 6; // stroke-width/2

    // Background circle
    final bgPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, bgPaint);

    // Progress circle with gradient
    final gradient = LinearGradient(
      colors: const [Color(0xFF1313EC), Color(0xFFE11D48)],
      begin: const Alignment(-1, -1),
      end: const Alignment(1, 1),
    );
    final progressPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final circumference = 2 * math.pi * radius;
    final sweepAngle = 2 * math.pi * (85 / 100); // 85%
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BarChartItem extends StatelessWidget {
  final double heightFraction;
  final String label;

  const _BarChartItem({required this.heightFraction, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xFF1313EC).withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Container(
                height: heightFraction * 140, // Full height is 140
                decoration: BoxDecoration(
                  color: const Color(0xFF1313EC),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  final String subtitle;
  final String title;
  final String description;
  final String primaryAction;
  final IconData? primaryIcon;
  final VoidCallback onPrimaryPressed;

  const _SuggestionCard({
    required this.subtitle,
    required this.title,
    required this.description,
    required this.primaryAction,
    this.primaryIcon,
    required this.onPrimaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.015 * 18 / 1000,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: Colors.grey[300], fontSize: 16),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Dismiss',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: onPrimaryPressed,
                icon: primaryIcon != null ? Icon(primaryIcon, size: 16) : null,
                label: Text(primaryAction),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1313EC),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(84, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
