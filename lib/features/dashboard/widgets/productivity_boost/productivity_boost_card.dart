import 'package:flutter/material.dart';
import 'productivity_boost_actions.dart';

class ProductivityBoostCard extends StatelessWidget {
  final String message;

  const ProductivityBoostCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0x331313EC), Colors.transparent],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0x801313EC)),
        boxShadow: const [
          BoxShadow(color: Color(0x331313EC), blurRadius: 30, spreadRadius: 0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0x4D1313EC),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ProductivityBoostActions(
              onDismiss: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Suggestion dismissed."),
                    backgroundColor: Colors.grey[900],
                  ),
                );
              },
              onMerge: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Merged successfully!"),
                    backgroundColor: Colors.green[700],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
