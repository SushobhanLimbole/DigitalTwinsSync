import 'package:flutter/material.dart';

class EmptyStateCard extends StatelessWidget {
  const EmptyStateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.rocket_launch, size: 64, color: const Color(0xFF8A8D98)),
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
            onPressed: () {
              // Navigate to automation creation screen or open modal
            },
            icon: const Icon(Icons.add, size: 20),
            label: const Text('Create Automation'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00FFFF),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}