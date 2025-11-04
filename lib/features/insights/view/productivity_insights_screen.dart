import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProductivityInsightsScreen extends StatefulWidget {
  const ProductivityInsightsScreen({super.key});

  @override
  State<ProductivityInsightsScreen> createState() =>
      _ProductivityInsightsScreenState();
}

class _ProductivityInsightsScreenState
    extends State<ProductivityInsightsScreen> {
  int _selectedSegment = 0; // 0: Day, 1: Week, 2: Month, 3: All Time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: const Text(
          'Productivity Insights',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015 * 18 / 1000,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.notifications,
        //       size: 24,
        //       color: Colors.white70,
        //     ),
        //   ),
        // ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time Range Filter
            Padding(
              padding: const EdgeInsets.all(16),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 0, label: Text('Day')),
                  ButtonSegment(value: 1, label: Text('Week')),
                  ButtonSegment(value: 2, label: Text('Month')),
                  ButtonSegment(value: 3, label: Text('All Time')),
                ],
                selected: {_selectedSegment},
                onSelectionChanged: (Set<int> selection) {
                  setState(() {
                    _selectedSegment = selection.first;
                  });
                },
                style: SegmentedButton.styleFrom(
                  selectedBackgroundColor: Color(0x1A39FF14),
                  selectedForegroundColor: const Color(0xFF39FF14),
                  disabledBackgroundColor: Colors.transparent,
                  disabledForegroundColor: Colors.white70,
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            // This Week's Snapshot
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                "This Week's Snapshot",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 18 / 1000,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _SnapshotCard(
                        label: 'Tasks Done',
                        value: '84',
                        change: '+12%',
                        changeColor: const Color(0xFF39FF14),
                      ),
                      _SnapshotCard(
                        label: 'Focus Hours',
                        value: '26.5',
                        change: '+5%',
                        changeColor: const Color(0xFF39FF14),
                      ),
                      _SnapshotCard(
                        label: 'Efficiency',
                        value: '92%',
                        change: '-1%',
                        changeColor: const Color(0xFFFF00FF),
                      ),
                    ],
                  );
                },
              ),
            ),
            // AI Summary
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'AI Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 18 / 1000,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _SummaryCard(
                    icon: Icons.today,
                    title: 'Daily Summary',
                    text:
                        'Today, you focused intensely on Project A, completing 5 critical tasks. Your efficiency peaked mid-morning. Consider a short break after lunch to maintain momentum.',
                  ),
                  _SummaryCard(
                    icon: Icons.calendar_view_week,
                    title: 'Weekly Summary',
                    text:
                        'This week saw a 12% increase in task completion. Your focus hours were highest on Friday. Workload was heavily skewed towards Project A (60%), suggesting a need for better task delegation next week.',
                  ),
                  _SummaryCard(
                    icon: Icons.calendar_month,
                    title: 'Monthly Summary',
                    text:
                        'This month, you\'ve consistently improved your productivity trend. While overall efficiency is high, data shows a slight dip in the third week. Analyzing the tasks from that period could reveal optimization opportunities.',
                  ),
                ],
              ),
            ),
            // Charts Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Productivity Trend
                  _ChartCard(
                    title: 'Productivity Trend',
                    value: '92%',
                    subtitle: 'This Week',
                    change: '+2.5%',
                    changeIcon: Icons.trending_up,
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        CustomPaint(
                          size: Size(double.infinity, 148),
                          painter: ProductivityTrendPainter(),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Mon',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Tue',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Wed',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Thu',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Fri',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sat',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sun',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Workload Distribution
                  _ChartCard(
                    title: 'Workload Distribution',
                    subtitle: '',
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          const _DonutChart(),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                _PieSlice(
                                  'Project A',
                                  60,
                                  const Color(0xFF00BFFF),
                                ),
                                _PieSlice(
                                  'Meetings',
                                  30,
                                  const Color(0xFFFF00FF),
                                ),
                                _PieSlice('Admin', 10, const Color(0xFF39FF14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Daily Task Completion
                  _ChartCard(
                    title: 'Daily Task Completion',
                    value: '12 avg.',
                    subtitle: 'This Week',
                    change: '+8.0%',
                    changeIcon: Icons.trending_up,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: _BarChart(),
                    ),
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

class _SnapshotCard extends StatelessWidget {
  final String label;
  final String value;
  final String change;
  final Color changeColor;

  const _SnapshotCard({
    required this.label,
    required this.value,
    required this.change,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.05), Colors.transparent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            change,
            style: TextStyle(
              color: changeColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _SummaryCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.05), Colors.transparent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF39FF14), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  final String title;
  final String? value;
  final String subtitle;
  final String? change;
  final IconData? changeIcon;
  final Widget child;

  const _ChartCard({
    required this.title,
    this.value,
    required this.subtitle,
    this.change,
    this.changeIcon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.05), Colors.transparent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          if (value != null) ...[
            const SizedBox(height: 4),
            Text(
              value!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              if (change != null) ...[
                const SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(changeIcon, size: 16, color: const Color(0xFF39FF14)),
                    const SizedBox(width: 2),
                    Text(
                      change!,
                      style: const TextStyle(
                        color: Color(0xFF39FF14),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
          child,
        ],
      ),
    );
  }
}

class ProductivityTrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height - 40)
      ..lineTo(18.15, size.height - 128)
      ..lineTo(36.31, size.height - 128)
      ..lineTo(54.46, size.height - 108)
      ..lineTo(72.62, size.height - 56)
      ..lineTo(90.77, size.height - 56)
      ..lineTo(108.92, size.height - 116)
      ..lineTo(127.08, size.height - 116)
      ..lineTo(145.23, size.height - 76)
      ..lineTo(163.38, size.height - 48)
      ..lineTo(181.54, size.height - 48)
      ..lineTo(199.69, size.height - 88)
      ..lineTo(217.85, size.height - 104)
      ..lineTo(236, size.height - 104)
      ..lineTo(254.15, size.height - 28)
      ..lineTo(272.31, size.height - 28)
      ..lineTo(290.46, size.height - 0)
      ..lineTo(308.62, size.height - 0)
      ..lineTo(326.77, size.height - 148)
      ..lineTo(344.92, size.height - 148)
      ..lineTo(363.08, size.height - 68)
      ..lineTo(381.23, size.height - 68)
      ..lineTo(399.38, size.height - 20)
      ..lineTo(417.54, size.height - 20)
      ..lineTo(435.69, size.height - 20)
      ..lineTo(size.width, size.height - 124)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final gradient = LinearGradient(
      colors: [
        const Color(0xFF39FF14).withOpacity(0.3),
        const Color(0xFF39FF14).withOpacity(0),
      ],
    );
    final fillPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    canvas.drawPath(path, fillPaint);

    final linePaint = Paint()
      ..color = const Color(0xFF39FF14)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final linePath = Path()
      ..moveTo(0, size.height - 40)
      ..lineTo(18.15, size.height - 128)
      ..lineTo(36.31, size.height - 128)
      ..lineTo(54.46, size.height - 108)
      ..lineTo(72.62, size.height - 56)
      ..lineTo(90.77, size.height - 56)
      ..lineTo(108.92, size.height - 116)
      ..lineTo(127.08, size.height - 116)
      ..lineTo(145.23, size.height - 76)
      ..lineTo(163.38, size.height - 48)
      ..lineTo(181.54, size.height - 48)
      ..lineTo(199.69, size.height - 88)
      ..lineTo(217.85, size.height - 104)
      ..lineTo(236, size.height - 104)
      ..lineTo(254.15, size.height - 28)
      // ..lineTo(272.31, size.height - 28)
      // ..lineTo(290.46, size.height - 0)
      // ..lineTo(308.62, size.height - 0)
      // ..lineTo(326.77, size.height - 148)
      // ..lineTo(344.92, size.height - 148)
      // ..lineTo(363.08, size.height - 68)
      // ..lineTo(381.23, size.height - 68)
      // ..lineTo(399.38, size.height - 20)
      // ..lineTo(417.54, size.height - 20)
      // ..lineTo(435.69, size.height - 20)
      ..lineTo(size.width, size.height - 124);
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DonutChart extends StatelessWidget {
  const _DonutChart();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(size: const Size(140, 140), painter: DonutChartPainter()),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Time',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              '48h 15m',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 7; // Adjust for stroke width

    // Project A - 60% (216 degrees)
    final paintA = Paint()
      ..color = const Color(0xFF00BFFF)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      1.8 * math.pi,
      false,
      paintA,
    );

    // Meetings - 30% (108 degrees)
    final paintB = Paint()
      ..color = const Color(0xFFFF00FF)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + 1.8 * math.pi,
      0.9 * math.pi,
      false,
      paintB,
    );

    // Admin - 10% (36 degrees)
    final paintC = Paint()
      ..color = const Color(0xFF39FF14)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + 2.7 * math.pi,
      0.3 * math.pi,
      false,
      paintC,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PieSlice extends StatelessWidget {
  final String label;
  final double percentage;
  final Color color;

  const _PieSlice(this.label, this.percentage, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
        ),
        const Spacer(),
        Text(
          '${percentage}%',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    final heights = [0.80, 0.30, 0.70, 0.60, 0.95, 0.40, 0.20];
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = (constraints.maxWidth - 48) / 7;
        return Column(
          children: [
            SizedBox(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  return SizedBox(
                    width: barWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: barWidth - 8,
                              height: heights[index] * 180,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(4),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF00BFFF).withOpacity(0.6),
                                    const Color(0xFF00BFFF),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                7,
                (index) => Text(
                  days[index],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
