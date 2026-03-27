import 'dart:convert';

class TaskModel {
  String id;
  String title;
  String priority; // 'Low', 'Medium', 'High'
  DateTime? deadline;
  String category;
  bool isCompleted;
  DateTime createdAt;
  DateTime? completedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.priority,
    this.deadline,
    required this.category,
    this.isCompleted = false,
    required this.createdAt,
    this.completedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'deadline': deadline?.toIso8601String(),
      'category': category,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      priority: map['priority'] ?? 'Low',
      deadline: map['deadline'] != null ? DateTime.parse(map['deadline']) : null,
      category: map['category'] ?? 'General',
      isCompleted: map['isCompleted'] ?? false,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : DateTime.now(),
      completedAt: map['completedAt'] != null ? DateTime.parse(map['completedAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));
}
