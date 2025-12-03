import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const ConfirmPasswordField({super.key, required this.controller});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Confirm Password", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
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