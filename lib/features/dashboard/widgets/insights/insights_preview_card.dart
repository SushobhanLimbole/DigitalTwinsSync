import 'package:flutter/material.dart';
import 'progress_ring.dart';
import 'stat_card.dart';

class InsightsPreviewCard extends StatelessWidget {
  const InsightsPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            ProgressRing(
              progress: 0.75,
              label: 'Task Completion',
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    value: '4h',
                    label: 'Focus Time',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    value: '8/10',
                    label: 'Productivity Score',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}