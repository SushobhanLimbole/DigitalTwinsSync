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
    return _field(
      label: "Password",
      controller: widget.controller,
    );
  }

  Widget _field({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "••••••••",
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white10,
            suffixIcon: IconButton(
              icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => obscure = !obscure),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}