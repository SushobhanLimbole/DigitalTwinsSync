import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final String? value;
  final String subtitle;
  final String? change;
  final IconData? changeIcon;
  final Widget child;

  const ChartCard({
    super.key,
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
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.05), Colors.transparent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),

          if (value != null) ...[
            SizedBox(height: 4),
            Text(
              value!,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],

          // Subtitle + change indicator
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              if (change != null) ...[
                SizedBox(width: 8),
                Row(
                  children: [
                    Icon(changeIcon, size: 16, color: const Color(0xFF39FF14)),
                    SizedBox(width: 2),
                    Text(
                      change!,
                      style: TextStyle(
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

          // Chart child
          child,
        ],
      ),
    );
  }
}
