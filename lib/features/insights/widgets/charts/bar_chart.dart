import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key});

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