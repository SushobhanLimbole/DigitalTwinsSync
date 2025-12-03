import 'package:flutter/material.dart';
import '../general/section_header.dart';
import 'toggle_item.dart';

class AiEngineCard extends StatelessWidget {
  final bool enablePersonalization;
  final bool enableAutomations;

  final ValueChanged<bool> onPersonalizationChanged;
  final ValueChanged<bool> onAutomationsChanged;

  const AiEngineCard({
    super.key,
    required this.enablePersonalization,
    required this.enableAutomations,
    required this.onPersonalizationChanged,
    required this.onAutomationsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'AI Engine'),
          const SizedBox(height: 16),
          ToggleItem(
            title: 'Enable AI Personalization',
            subtitle:
                'Allow your Twin to learn from your workflows for smarter assistance.',
            value: enablePersonalization,
            onChanged: onPersonalizationChanged,
          ),
          const Divider(color: Colors.white10),
          ToggleItem(
            title: 'Enable AI Automations',
            subtitle:
                'Allow your Twin to automatically perform tasks on your behalf.',
            value: enableAutomations,
            onChanged: onAutomationsChanged,
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