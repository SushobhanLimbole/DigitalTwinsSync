class AISuggestion {
  final String id;
  final String message;
  final SuggestionType type;
  final DateTime timestamp;

  AISuggestion({
    required this.id,
    required this.message,
    required this.type,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

enum SuggestionType {
  info,
  warning,
  success,
  urgent
}
