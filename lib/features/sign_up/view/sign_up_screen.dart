import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../controller/sign_up_controller.dart';
import '../widgets/sign_up_background.dart';
import '../widgets/username_field.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/confirm_password_field.dart';
import '../widgets/sign_up_button.dart';
import '../../sign_in/view/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SignUpBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    children: [
                      _header(),
                      const SizedBox(height: 24),
                      _formCard(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      children: const [
        Icon(Icons.sync_alt, size: 64, color: Colors.white),
        SizedBox(height: 12),
        Text(
          "Digital Twins Sync",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          "Create your account to sync your digital twin.",
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _formCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          UsernameField(controller: controller.username),
          const SizedBox(height: 16),
          EmailField(controller: controller.email),
          const SizedBox(height: 16),
          PasswordField(controller: controller.password),
          const SizedBox(height: 16),
          ConfirmPasswordField(controller: controller.confirmPassword),
          const SizedBox(height: 24),
          SignUpButton(controller: controller),
          const SizedBox(height: 16),
          _signInLink(context),
        ],
      ),
    );
  }

  Widget _signInLink(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Already have an account? ",
            style: TextStyle(color: Colors.grey),
          ),
          TextSpan(
            text: "Sign In",
            style: const TextStyle(
              color: Color(0xFF7C3AED),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignInScreen()),
                  ),
          ),
        ],
      ),
    );
  }
}