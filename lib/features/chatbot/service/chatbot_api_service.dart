// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ChatbotApiService {
//   static const String baseUrl = "http://localhost:3000/api";

//   Future<String> sendChatPrompt(String prompt) async {
//     final response = await http.post(
//       Uri.parse("$baseUrl/chat"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"prompt": prompt}),
//     );

//     final data = jsonDecode(response.body);
//     return data["reply"];
//   }

//   Future<String> generateEmailFromPrompt(String prompt) async {
//     final response = await http.post(
//       Uri.parse("$baseUrl/email/generate"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"prompt": prompt}),
//     );

//     final data = jsonDecode(response.body);
//     return data["email"];
//   }

//   Future<bool> sendEmail(String to, String subject, String body) async {
//     final response = await http.post(
//       Uri.parse("$baseUrl/email/send"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "to": to,
//         "subject": subject,
//         "body": body,
//       }),
//     );

//     return response.statusCode == 200;
//   }

//   Future<List<dynamic>> getLatestEmails() async {
//     final response = await http.get(Uri.parse("$baseUrl/email/latest"));

//     return jsonDecode(response.body);
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotApiService {
  static const String baseUrl = "http://localhost:3000/api";

  /// 🔹 Send chat prompt to Gemini
  Future<String> sendChatPrompt(String prompt) async {
    final response = await http.post(
      Uri.parse("$baseUrl/chat"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"prompt": prompt}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data["success"] == true) {
      return data["reply"];
    } else {
      throw Exception(data["error"] ?? "Failed to get Gemini response");
    }
  }

  /// 🔹 Generate an email body USING Gemini (we use the /chat endpoint)
  Future<String> generateEmailFromPrompt(String prompt) async {
    final response = await http.post(
      Uri.parse("$baseUrl/chat"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"prompt": prompt}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data["success"] == true) {
      return data["reply"]; // Gemini-generated email text
    } else {
      throw Exception(data["error"] ?? "Failed to generate email text");
    }
  }

  /// 🔹 Send an email via Gmail API backend
  Future<bool> sendEmail(String to, String subject, String body) async {
    final response = await http.post(
      Uri.parse("$baseUrl/gmail/send"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"to": to, "subject": subject, "body": body}),
    );

    return response.statusCode == 200;
  }

  /// 🔹 Fetch latest 10 emails
  Future<List<dynamic>> getLatestEmails() async {
    final response = await http.get(
      Uri.parse("$baseUrl/gmail/messages?max=10"),
    );

    final data = jsonDecode(response.body);
    print("data: $data");

    if (response.statusCode == 200 && data["success"] == true) {
      return data["data"]; // list of emails
    } else {
      throw Exception(data["error"] ?? "Failed to load emails");
    }
  }
}
