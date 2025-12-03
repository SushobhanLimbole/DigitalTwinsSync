import '../service/chatbot_api_service.dart';
import '../models/chat_message.dart';
import '../models/email_message.dart';

class ChatbotController {
  final ChatbotApiService api = ChatbotApiService();

  List<ChatMessage> messages = [];
  List<EmailModel> latestEmails = [];

  Future<void> sendMessage(String text) async {
    messages.add(ChatMessage(text: text, isUser: true));

    final reply = await api.sendChatPrompt(text);

    messages.add(ChatMessage(text: reply, isUser: false));
  }

  Future<void> retrieveEmails() async {
    final emailList = await api.getLatestEmails();

    

    latestEmails = emailList
        .map<EmailModel>((json) => EmailModel.fromJson(json))
        .toList();
  }
}