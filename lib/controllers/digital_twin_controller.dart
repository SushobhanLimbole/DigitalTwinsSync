import 'package:get/get.dart';
import 'task_controller.dart';
import '../models/user_profile.dart';
import '../models/ai_suggestion.dart';
import '../models/task_model.dart';

class DigitalTwinController extends GetxController {
  final TaskController taskController = Get.find<TaskController>();
  
  var userProfile = UserProfile().obs;
  var suggestions = <AISuggestion>[].obs;

  @override
  void onInit() {
    super.onInit();
    // React to any changes in the tasks list
    ever(taskController.tasks, (_) => analyzeBehavior());
    
    // Initial analysis
    analyzeBehavior();
  }

  void analyzeBehavior() {
    final tasks = taskController.tasks;
    if (tasks.isEmpty) {
      userProfile.value = UserProfile();
      suggestions.value = [
        AISuggestion(
          id: 'welcome',
          message: "Welcome to Digital Twins Sync! Add some tasks to start building your behavior profile.",
          type: SuggestionType.info,
        )
      ];
      return;
    }

    int completed = 0;
    int delayed = 0;
    Map<String, int> categoryCount = {};
    Map<int, int> hourActivity = {}; // Hour (0-23) -> Count of completed tasks

    for (var task in tasks) {
      if (task.isCompleted) {
        completed++;
        // Track category
        categoryCount[task.category] = (categoryCount[task.category] ?? 0) + 1;
        
        // Track active hours based on completion time
        if (task.completedAt != null) {
          int hour = task.completedAt!.hour;
          hourActivity[hour] = (hourActivity[hour] ?? 0) + 1;
        }
      } else {
        // Check if delayed
        if (task.deadline != null && task.deadline!.isBefore(DateTime.now())) {
          delayed++;
        }
      }
    }

    double score = (completed / tasks.length) * 100;
    
    // Find most active hour
    String peakHourStr = "Not enough data";
    if (hourActivity.isNotEmpty) {
      var peakHour = hourActivity.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      peakHourStr = "$peakHour:00 - ${peakHour + 1}:00";
    }

    userProfile.value = UserProfile(
      productivityScore: score,
      totalTasksCompleted: completed,
      totalTasksCreated: tasks.length,
      tasksDelayed: delayed,
      mostActiveHour: peakHourStr,
      tasksByCategory: categoryCount,
    );

    generateSuggestions();
  }

  void generateSuggestions() {
    List<AISuggestion> newSuggestions = [];
    final profile = userProfile.value;

    // Rule 1: High Productivity
    if (profile.productivityScore > 70 && profile.totalTasksCreated > 3) {
      newSuggestions.add(AISuggestion(
        id: 'high_prod',
        message: "You're doing great! You've completed ${profile.productivityScore.toStringAsFixed(0)}% of your tasks.",
        type: SuggestionType.success,
      ));
    }

    // Rule 2: Delayed Tasks Warning
    if (profile.tasksDelayed > 2) {
      newSuggestions.add(AISuggestion(
        id: 'delayed_warning',
        message: "You tend to delay tasks (${profile.tasksDelayed} overdue). Consider rescheduling high-priority work earlier in the day.",
        type: SuggestionType.warning,
      ));
    }

    // Rule 3: Peak Productivity Time
    if (profile.mostActiveHour != "Not enough data") {
      newSuggestions.add(AISuggestion(
        id: 'peak_time',
        message: "Your peak productivity window is around ${profile.mostActiveHour}. Schedule important tasks during this time.",
        type: SuggestionType.info,
      ));
    }
    
    // Rule 4: Add tasks prompt
    if (taskController.todayTasks.isEmpty && DateTime.now().hour < 12) {
      newSuggestions.add(AISuggestion(
        id: 'plan_day',
        message: "You haven't planned your day yet. Add some tasks to stay on track.",
        type: SuggestionType.info,
      ));
    }

    // Ensure we have at least 1 suggestion, cap at 3
    if (newSuggestions.isEmpty) {
      newSuggestions.add(AISuggestion(
        id: 'keep_going',
        message: "Keep tracking your tasks to let the AI build a better profile of your working habits.",
        type: SuggestionType.info,
      ));
    }
    
    if (newSuggestions.length > 3) {
      newSuggestions = newSuggestions.sublist(0, 3);
    }
    
    suggestions.value = newSuggestions;
  }
}
