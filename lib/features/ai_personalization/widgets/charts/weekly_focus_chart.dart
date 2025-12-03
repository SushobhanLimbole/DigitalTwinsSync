import 'package:flutter/material.dart';
import 'bar_chart_item.dart';

class WeeklyFocusChart extends StatelessWidget {
  final int selectedSegment;
  final ValueChanged<int> onSegmentChanged;

  const WeeklyFocusChart({
    super.key,
    required this.selectedSegment,
    required this.onSegmentChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
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
                const Text(
                  '+15%',
                  style: TextStyle(
                    color: Color(0xFF0BDA68),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            /// Segmented Button
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 0, label: Text('Day')),
                ButtonSegment(value: 1, label: Text('Week')),
                ButtonSegment(value: 2, label: Text('Month')),
              ],
              selected: {selectedSegment},
              onSelectionChanged: (set) =>
                  onSegmentChanged(set.first),
              style: SegmentedButton.styleFrom(
                selectedBackgroundColor: Colors.transparent,
                selectedForegroundColor: Colors.white,
                disabledBackgroundColor: Colors.transparent,
                disabledForegroundColor: Colors.grey,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          BarChartItem(heightFraction: 0.70, label: 'Mon'),
          BarChartItem(heightFraction: 0.40, label: 'Tue'),
          BarChartItem(heightFraction: 0.70, label: 'Wed'),
          BarChartItem(heightFraction: 0.60, label: 'Thu'),
          BarChartItem(heightFraction: 0.40, label: 'Fri'),
          BarChartItem(heightFraction: 0.80, label: 'Sat'),
          BarChartItem(heightFraction: 0.90, label: 'Sun'),
        ],
      ),
    );
  }
}