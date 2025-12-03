import 'package:flutter/material.dart';

class ProfileFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String placeholder;
  final bool enabled;

  const ProfileFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.placeholder,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFEAEAEA),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Color(0xFF9D9DB9)),
            filled: true,
            fillColor: const Color(0xFF282839),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF4D9FFF)),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}