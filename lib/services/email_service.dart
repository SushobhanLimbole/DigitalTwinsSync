import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class EmailSyncService {
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:3000';
    if (Platform.isAndroid) return 'http://10.0.2.2:3000';
    return 'http://localhost:3000';
  }

  static Future<List<TaskModel>> syncEmails() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/gmail/analyze-emails'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['tasks'] != null) {
          List<TaskModel> tasks = [];
          for (var item in data['tasks']) {
             tasks.add(TaskModel(
               id: DateTime.now().millisecondsSinceEpoch.toString() + '_' + (item['title'] ?? '').hashCode.toString(),
               title: item['title'] ?? 'Email Task',
               priority: item['priority'] ?? 'Medium',
               category: item['category'] ?? 'Work',
               createdAt: DateTime.now(),
               deadline: item['deadline'] != null ? DateTime.tryParse(item['deadline']) : null,
             ));
          }
          return tasks;
        }
      }
      throw Exception('Failed to load tasks from emails. Server returned ${response.statusCode}');
    } catch (e) {
      throw Exception('Error syncing emails: $e');
    }
  }
}
