import 'package:flutter/material.dart';
import '../general/section_header.dart';
import 'dropdown_field.dart';

class PreferencesCard extends StatelessWidget {
  final String notificationLevel;
  final String theme;
  final ValueChanged<String?> onNotificationChanged;
  final ValueChanged<String?> onThemeChanged;

  const PreferencesCard({
    super.key,
    required this.notificationLevel,
    required this.theme,
    required this.onNotificationChanged,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Preferences'),
          const SizedBox(height: 16),
          DropdownField(
            label: 'Notification Level',
            value: notificationLevel,
            items: const ['Minimal', 'Balanced', 'All'],
            onChanged: onNotificationChanged,
          ),
          DropdownField(
            label: 'Theme',
            value: theme,
            items: const ['Light', 'Dark', 'System'],
            onChanged: onThemeChanged,
          ),
        ],
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}