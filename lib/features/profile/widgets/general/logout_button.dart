import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF4D9FFF),
          backgroundColor: const Color(0x331313EC),
          side: BorderSide(
            color: const Color(0xFF4D9FFF).withOpacity(0.2),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Log Out',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}