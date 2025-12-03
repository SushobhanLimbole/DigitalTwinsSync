import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/filters/time_filter_segment.dart';

import '../widgets/snapshot/snapshot_card.dart';

import '../widgets/summary/summary_card.dart';

import '../widgets/charts/chart_card.dart';
import '../widgets/charts/productivity_trend_painter.dart';
import '../widgets/charts/donut_chart.dart';
import '../widgets/charts/pie_slice.dart';
import '../widgets/charts/bar_chart.dart';

class ProductivityInsightsScreen extends StatefulWidget {
  const ProductivityInsightsScreen({super.key});

  @override
  State<ProductivityInsightsScreen> createState() =>
      _ProductivityInsightsScreenState();
}

class _ProductivityInsightsScreenState
    extends State<ProductivityInsightsScreen> {
  int _selectedSegment = 0; // Day, Week, Month, All Time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
      backgroundColor: const Color(0xFF101022),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        'Productivity Insights',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time filter
          Padding(
            padding: const EdgeInsets.all(16),
            child: TimeFilterSegment(
              selected: _selectedSegment,
              onChanged: (value) => setState(() => _selectedSegment = value),
            ),
          ),

          // This Week Snapshot
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              "This Week's Snapshot",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          _buildSnapshotSection(),

          // AI Summary
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'AI Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          _buildSummarySection(),

          // Charts
          Padding(
            padding: const EdgeInsets.all(16),
            child: _buildChartsSection(),
          ),
        ],
      ),
    );
  }

  // SNAPSHOT SECTION
  Widget _buildSnapshotSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: const [
          SnapshotCard(
            label: 'Tasks Done',
            value: '84',
            change: '+12%',
            changeColor: Color(0xFF39FF14),
          ),
          SnapshotCard(
            label: 'Focus Hours',
            value: '26.5',
            change: '+5%',
            changeColor: Color(0xFF39FF14),
          ),
          SnapshotCard(
            label: 'Efficiency',
            value: '92%',
            change: '-1%',
            changeColor: Color(0xFFFF00FF),
          ),
        ],
      ),
    );
  }

  // SUMMARY SECTION
  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          SummaryCard(
            icon: Icons.today,
            title: 'Daily Summary',
            text:
                'Today, you focused intensely on Project A, completing 5 critical tasks. Your efficiency peaked mid-morning. Consider a short break after lunch.',
          ),
          SummaryCard(
            icon: Icons.calendar_view_week,
            title: 'Weekly Summary',
            text:
                'This week saw a 12% increase in task completion. Focus hours peaked Friday. Workload was skewed towards Project A (60%).',
          ),
          SummaryCard(
            icon: Icons.calendar_month,
            title: 'Monthly Summary',
            text:
                'Consistent improvement all month. Slight dip in week 3 — review tasks from that window for optimization insights.',
          ),
        ],
      ),
    );
  }

  // CHARTS SECTION
  Widget _buildChartsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Productivity Trend
        ChartCard(
          title: 'Productivity Trend',
          value: '92%',
          subtitle: 'This Week',
          change: '+2.5%',
          changeIcon: Icons.trending_up,
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomPaint(
                size: const Size(double.infinity, 148),
                painter: ProductivityTrendPainter(),
              ),
              const SizedBox(height: 16),
              _buildDaysRow(),
            ],
          ),
        ),

        // Workload Distribution
        ChartCard(
          title: 'Workload Distribution',
          subtitle: '',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                const DonutChart(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: const [
                      PieSlice('Project A', 60, Color(0xFF00BFFF)),
                      PieSlice('Meetings', 30, Color(0xFFFF00FF)),
                      PieSlice('Admin', 10, Color(0xFF39FF14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Daily Task Completion
        ChartCard(
          title: 'Daily Task Completion',
          value: '12 avg.',
          subtitle: 'This Week',
          change: '+8.0%',
          changeIcon: Icons.trending_up,
          child: const Padding(
            padding: EdgeInsets.only(top: 16),
            child: BarChart(),
          ),
        ),
      ],
    );
  }

  // Day labels under productivity trend
  Widget _buildDaysRow() {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((d) => Text(
                d,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ))
          .toList(),
    );
  }
}