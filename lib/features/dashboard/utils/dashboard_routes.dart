import 'package:digital_twins/features/automation/view/automation_screen.dart';
import 'package:digital_twins/features/chatbot/view/chatbot_screen.dart';
import 'package:flutter/material.dart';
import 'package:digital_twins/features/profile/view/profile_screen.dart';
import 'package:digital_twins/features/insights/view/productivity_insights_screen.dart';
import 'package:digital_twins/features/ai_personalization/view/ai_personalization_screen.dart';

class DashboardRoutes {
  static void goToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const DigitalTwinProfileScreen()),
    );
  }

  static void goToInsights(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProductivityInsightsScreen()),
    );
  }

  static void goToAIPersonalization(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AIPersonalizationScreen()),
    );
  }

  static void goToAutomation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AutomationsScreen()),
    );
  }

  static void goToChatbot(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ChatbotScreen()),
    );
  }
}