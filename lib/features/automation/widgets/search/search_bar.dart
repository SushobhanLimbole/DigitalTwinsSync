import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;

  const CustomSearchBar({super.key, this.onChanged, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search automations...',
        hintStyle: const TextStyle(color: Color(0xFF8A8D98), fontSize: 16),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.search, color: Color(0xFF8A8D98), size: 24),
        ),
        filled: true,
        fillColor: const Color(0x991C1C27),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF00FFFF)),
        ),
      ),
      style: const TextStyle(color: Color(0xFFEAEAEA), fontSize: 16),
      textInputAction: TextInputAction.search,
      onSubmitted: (_) => onSubmitted?.call(),
    );
  }
}