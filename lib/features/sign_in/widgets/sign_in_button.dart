import 'package:flutter/material.dart';
import '../controller/sign_in_controller.dart';

class SignInButton extends StatelessWidget {
  final SignInController controller;

  const SignInButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => controller.submit(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
        ),
        child: const Text(
          "Sign In",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}