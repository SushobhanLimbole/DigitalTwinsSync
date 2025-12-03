import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: _decoration("Email Address", Icons.mail),
    );
  }

  InputDecoration _decoration(String label, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.white70),
      hintText: 'Enter your email',
      hintStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: Colors.white.withOpacity(0.05),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}