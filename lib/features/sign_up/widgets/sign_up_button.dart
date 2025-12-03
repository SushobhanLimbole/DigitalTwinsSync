import 'package:flutter/material.dart';
import '../controller/sign_up_controller.dart';

class SignUpButton extends StatelessWidget {
  final SignUpController controller;

  const SignUpButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7C3AED),
          foregroundColor: Colors.white,
        ),
        onPressed: () => controller.register(context),
        child: const Text(
          "Create Account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}