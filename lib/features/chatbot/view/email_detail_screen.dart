import 'package:flutter/material.dart';
import '../models/email_message.dart';

class EmailDetailScreen extends StatelessWidget {
  final EmailModel email;

  const EmailDetailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101022),
      appBar: AppBar(title: Text(email.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("From: ${email.from}",
                style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  email.snippet,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}