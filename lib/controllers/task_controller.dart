import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList('tasks') ?? [];
    tasks.value = tasksJson.map((t) => TaskModel.fromJson(t)).toList();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((t) => t.toJson()).toList();
    await prefs.setStringList('tasks', tasksJson);
  }

  Future<void> addTask(TaskModel task) async {
    tasks.add(task);
    await saveTasks();
  }

  Future<void> updateTask(TaskModel updatedTask) async {
    int index = tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      await saveTasks();
    }
  }

  Future<void> deleteTask(String id) async {
    tasks.removeWhere((t) => t.id == id);
    await saveTasks();
  }

  Future<void> toggleTaskCompletion(String id) async {
    int index = tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      var task = tasks[index];
      task.isCompleted = !task.isCompleted;
      task.completedAt = task.isCompleted ? DateTime.now() : null;
      tasks[index] = task;
      await saveTasks();
    }
  }

  // Getters for specific task states
  List<TaskModel> get pendingTasks => tasks.where((t) => !t.isCompleted).toList();
  List<TaskModel> get completedTasks => tasks.where((t) => t.isCompleted).toList();
  
  List<TaskModel> get todayTasks {
    final now = DateTime.now();
    return tasks.where((t) {
      if (t.deadline == null) return false;
      return t.deadline!.year == now.year &&
             t.deadline!.month == now.month &&
             t.deadline!.day == now.day && 
             !t.isCompleted;
    }).toList();
  }
}
