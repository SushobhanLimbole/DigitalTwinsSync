import 'package:flutter/material.dart';
import 'package:digital_twins/features/insights/view/productivity_insights_screen.dart';
import 'ai_priority_button.dart';

class AiPriorityCard extends StatelessWidget {
  final String message;
  final String subtitle;

  const AiPriorityCard({
    super.key,
    required this.message,
    required this.subtitle,
  });

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.015 * 18 / 1000,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: AiPriorityButton(
                label: "View Details",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProductivityInsightsScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}