import 'package:digital_twins/features/ai_personalization/view/ai_personalization_screen.dart';
import 'package:digital_twins/features/automation/view/automation_screen.dart';
import 'package:digital_twins/features/chatbot/view/chatbot_screen.dart';
import 'package:digital_twins/features/dashboard/view/dashboard_screen.dart';
import 'package:digital_twins/features/insights/view/productivity_insights_screen.dart';
import 'package:digital_twins/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:digital_twins/shared/theme/theme_notifier.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                SizedBox(height: 12),
                Text(
                  'Alex Ryder',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
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
            leading: Icon(Icons.person),
            title: Text('Profile'),
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
            leading: Icon(Icons.smart_toy),
            title: Text('AI Personalization'),
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
            leading: Icon(Icons.developer_mode),
            title: Text('Automations'),
            onTap: () {
              // Navigate to home or close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AutomationsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.insights),
            title: Text('Productivity Insights'),
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
            leading: Icon(Icons.email),
            title: Text('Chatbot and emails'),
            onTap: () {
              // Navigate to home or close drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatbotScreen()),
              );
            },
          ),
          ListTile(
            leading: ListenableBuilder(
              listenable: themeNotifier,
              builder: (context, _) {
                return Icon(
                  themeNotifier.isDark ? Icons.dark_mode : Icons.light_mode,
                );
              },
            ),
            title: Text('Toggle Theme'),
            trailing: ListenableBuilder(
              listenable: themeNotifier,
              builder: (context, _) {
                return Switch(
                  value: themeNotifier.isDark,
                  onChanged: (value) {
                    themeNotifier.toggleTheme();
                  },
                );
              },
            ),
            onTap: () {
              themeNotifier.toggleTheme();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
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
