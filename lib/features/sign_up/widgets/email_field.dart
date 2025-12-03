import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "john.doe@example.com",
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white10,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}