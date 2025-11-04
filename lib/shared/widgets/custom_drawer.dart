import 'package:digital_twins/features/ai_personalization/view/ai_personalization_screen.dart';
import 'package:digital_twins/features/automation/view/automation_screen.dart';
import 'package:digital_twins/features/dashboard/view/dashboard_screen.dart';
import 'package:digital_twins/features/insights/view/productivity_insights_screen.dart';
import 'package:digital_twins/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Alex Ryder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              // Navigate to home or close drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DigitalTwinsDashboard(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Navigate to settings
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DigitalTwinProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.smart_toy),
            title: const Text('AI Personalization'),
            onTap: () {
              // Navigate to home or close drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AIPersonalizationScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.developer_mode),
            title: const Text('Automations'),
            onTap: () {
              // Navigate to home or close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AutomationsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.insights),
            title: const Text('Productivity Insights'),
            onTap: () {
              // Navigate to home or close drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductivityInsightsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
