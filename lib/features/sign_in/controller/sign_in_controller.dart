import 'dart:convert';
import 'package:digital_twins/features/dashboard/view/dashboard_screen.dart';
import 'package:digital_twins/features/sign_in/model/sign_in_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validateInputs(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      _showSnack(context, "Enter a valid email");
      return false;
    }

    final passRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
    if (!passRegex.hasMatch(password)) {
      _showSnack(context,
          "Password must have 1 uppercase, 1 digit, and be 6+ characters");
      return false;
    }

    return true;
  }

  Future<void> submit(BuildContext context) async {
    if (!validateInputs(context)) return;

    final request = SignInRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      final response = await http.post(
        Uri.parse("http://localhost:8080/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["success"] == true) {
        final token = data["data"]["token"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("auth_token", token);

        _showSnack(context, data["message"], success: true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DigitalTwinsDashboard()),
        );
      } else {
        _showSnack(context, data["message"]);
      }
    } catch (e) {
      _showSnack(context, "Something went wrong. Try again.");
    }
  }

  void _showSnack(BuildContext context, String message, {bool success = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: success ? Colors.green : Colors.red,
        content: Text(message),
      ),
    );
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}