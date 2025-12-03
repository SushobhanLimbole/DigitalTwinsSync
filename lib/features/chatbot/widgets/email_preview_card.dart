import 'package:flutter/material.dart';
import '../models/email_message.dart';

class EmailPreviewCard extends StatelessWidget {
  final EmailModel email;
  final VoidCallback onTap;

  const EmailPreviewCard({super.key, required this.email, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E2E),
      child: ListTile(
        title: Text(email.from, style: const TextStyle(color: Colors.white)),
        subtitle: Text(email.subject,
            style: const TextStyle(color: Colors.white70)),
        onTap: onTap,
      ),
    );
  }
}