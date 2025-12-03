class EmailModel {
  final String id;
  final String from;
  final String subject;
  final String snippet;

  EmailModel({
    required this.id,
    required this.from,
    required this.subject,
    required this.snippet,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      id: json["id"] ?? "",
      from: json["from"] ?? "Unknown Sender",
      subject: json["subject"] ?? "(No Subject)",
      snippet: json["snippet"] ?? "",
    );
  }
}