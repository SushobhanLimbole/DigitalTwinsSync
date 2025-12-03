import 'package:flutter/material.dart';

class AutomationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isEnabled;
  final IconData? footerIcon;
  final String? footerText;
  final bool showProgress;
  final double? progressValue;

  const AutomationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isEnabled,
    this.footerIcon,
    this.footerText,
    this.showProgress = false,
    this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: Colors.white.withOpacity(0.1));
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
        border: border,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0x1A00FFFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: const Color(0xFF00FFFF), size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFFEAEAEA),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF8A8D98),
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Switch(
                value: isEnabled,
                onChanged: (_) {
                  // Ideally you pass a callback to toggle state; kept noop to preserve original behavior
                },
                activeColor: const Color(0xFF00FFFF),
                activeTrackColor: const Color(0x1A00FFFF),
                inactiveThumbColor: Colors.white.withOpacity(0.5),
                inactiveTrackColor: Colors.black.withOpacity(0.3),
              ),
            ],
          ),

          // footer / progress
          if (footerIcon != null || footerText != null || showProgress)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  if (!showProgress)
                    Row(
                      children: [
                        Icon(footerIcon, color: const Color(0xFF8A8D98), size: 20),
                        const SizedBox(width: 8),
                        Text(
                          footerText ?? '',
                          style: const TextStyle(color: Color(0xFF8A8D98), fontSize: 14),
                        ),
                      ],
                    )
                  else ...[
                    Text(
                      footerText ?? '',
                      style: const TextStyle(color: Color(0xFF8A8D98), fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: progressValue ?? 0.0,
                        backgroundColor: Colors.black.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00FFFF)),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}