import 'package:flutter/material.dart';
import '../controller/chatbot_controller.dart';

class EmailComposeScreen extends StatefulWidget {
  const EmailComposeScreen({super.key});

  @override
  State<EmailComposeScreen> createState() => _EmailComposeScreenState();
}

class _EmailComposeScreenState extends State<EmailComposeScreen> {
  final ChatbotController controller = ChatbotController();

  final TextEditingController promptCtrl = TextEditingController();
  final TextEditingController bodyCtrl = TextEditingController();
  final TextEditingController toCtrl = TextEditingController();
  final TextEditingController subjectCtrl = TextEditingController();
  String generatedEmail = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("Write Email")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: toCtrl,
              decoration: _input("Recipient Email"),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 12),

            TextField(
              controller: subjectCtrl,
              decoration: _input("Subject"),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 12),

            TextField(
              controller: bodyCtrl,
              maxLines: 3,
              decoration: _input("Body"),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 12),

            TextField(
              controller: promptCtrl,
              maxLines: 3,
              decoration: _input("Describe the email you want Gemini to write"),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 12),

            ElevatedButton(
              onPressed: _generateEmail,
              child: Text("Generate Email with Gemini"),
            ),

            if (generatedEmail.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E2E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  generatedEmail,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),

            SizedBox(height: 12),

            ElevatedButton(onPressed: _sendEmail, child: Text("Send Email")),
          ],
        ),
      ),
    );
  }

  InputDecoration _input(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey),
    filled: true,
    fillColor: const Color(0xFF1E1E2E),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  );

  Future<void> _generateEmail() async {
    setState(() => loading = true);

    final email = await controller.api.generateEmailFromPrompt(promptCtrl.text);

    setState(() {
      generatedEmail = email;
      loading = false;
    });
  }

  Future<void> _sendEmail() async {
    await controller.api.sendEmail(
      toCtrl.text,
      subjectCtrl.text,
      bodyCtrl.text,
      // generatedEmail,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Email Sent Successfully!")));
  }
}
