import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/sign_up_request.dart';
import '../../sign_in/view/sign_in_screen.dart';

class SignUpController {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool validateForm(BuildContext context) {
    if (username.text.trim().isEmpty) {
      _showSnack(context, "Username cannot be empty");
      return false;
    }

    if (!email.text.contains("@")) {
      _showSnack(context, "Enter a valid email");
      return false;
    }

    final passRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
    if (!passRegex.hasMatch(password.text)) {
      _showSnack(
        context,
        "Password must contain 1 uppercase, 1 digit, and be 6+ characters",
      );
      return false;
    }

    if (password.text != confirmPassword.text) {
      _showSnack(context, "Passwords do not match");
      return false;
    }

    return true;
  }

  Future<void> register(BuildContext context) async {
    if (!validateForm(context)) return;

    final request = SignUpRequest(
      username: username.text.trim(),
      email: email.text.trim(),
      password: password.text.trim(),
    );

    try {
      print("request : " + jsonEncode(request.toJson()));

      final response = await http.post(
        Uri.parse("http://localhost:8080/auth/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      final data = jsonDecode(response.body);

      print("response: " + response.statusCode.toString());
      print("res: " + response.body);

      if (data["success"] == true) {
        _showSnack(context, data["message"], success: true);

        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => SignInScreen()),
          );
        });
      } else {
        _showSnack(context, data["message"]);
      }
    } catch (e) {
      _showSnack(context, "Something went wrong!");
    }
  }

  void _showSnack(
    BuildContext context,
    String message, {
    bool success = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: success ? Colors.green : Colors.red,
        content: Text(message),
      ),
    );
  }

  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
}
