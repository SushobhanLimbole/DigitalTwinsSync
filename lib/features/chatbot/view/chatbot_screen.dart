import 'package:digital_twins/features/chatbot/view/email_compose_screen.dart';
import 'package:flutter/material.dart';
import '../controller/chatbot_controller.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/email_preview_card.dart';
import 'email_detail_screen.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final ChatbotController controller = ChatbotController();
  final TextEditingController _promptController = TextEditingController();

  bool _isRetrievingEmails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101022),
      appBar: AppBar(
        title: const Text("AI Assistant"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          /// --- CHAT LIST ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                return ChatMessageBubble(message: controller.messages[index]);
              },
            ),
          ),

          /// --- BUTTONS ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EmailComposeScreen(),
                    ),
                  );
                },
                child: const Text("Send Email"),
              ),
              ElevatedButton(
                onPressed: _retrieveEmails,
                child: const Text("Retrieve Emails"),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// --- INPUT FIELD ---
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _promptController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Ask something...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF1E1E2E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () async {
                    final text = _promptController.text.trim();
                    if (text.isEmpty) return;

                    setState(() {});
                    await controller.sendMessage(text);
                    setState(() {});

                    _promptController.clear();
                  },
                ),
              ],
            ),
          ),

          if (_isRetrievingEmails)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),

          /// --- EMAIL RESULTS PREVIEW ---
          if (controller.latestEmails.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: controller.latestEmails.length,
                itemBuilder: (context, index) {
                  final email = controller.latestEmails[index];
                  return EmailPreviewCard(
                    email: email,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EmailDetailScreen(email: email),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _retrieveEmails() async {
    setState(() => _isRetrievingEmails = true);
    await controller.retrieveEmails();
    setState(() => _isRetrievingEmails = false);
  }
}