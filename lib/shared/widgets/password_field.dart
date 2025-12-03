import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Colors.white70),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => obscure = !obscure),
        ),
        hintText: "Enter your password",
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}