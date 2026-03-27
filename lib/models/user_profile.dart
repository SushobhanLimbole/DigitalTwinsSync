import 'dart:convert';

class UserProfile {
  double productivityScore; // 0.0 to 100.0
  int totalTasksCompleted;
  int totalTasksCreated;
  int tasksDelayed;
  String mostActiveHour; // e.g., "09:00 - 10:00 AM"
  Map<String, int> tasksByCategory;

  UserProfile({
    this.productivityScore = 0.0,
    this.totalTasksCompleted = 0,
    this.totalTasksCreated = 0,
    this.tasksDelayed = 0,
    this.mostActiveHour = "Not enough data",
    this.tasksByCategory = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'productivityScore': productivityScore,
      'totalTasksCompleted': totalTasksCompleted,
      'totalTasksCreated': totalTasksCreated,
      'tasksDelayed': tasksDelayed,
      'mostActiveHour': mostActiveHour,
      'tasksByCategory': tasksByCategory,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      productivityScore: map['productivityScore']?.toDouble() ?? 0.0,
      totalTasksCompleted: map['totalTasksCompleted']?.toInt() ?? 0,
      totalTasksCreated: map['totalTasksCreated']?.toInt() ?? 0,
      tasksDelayed: map['tasksDelayed']?.toInt() ?? 0,
      mostActiveHour: map['mostActiveHour'] ?? "Not enough data",
      tasksByCategory: Map<String, int>.from(map['tasksByCategory'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source));
}
