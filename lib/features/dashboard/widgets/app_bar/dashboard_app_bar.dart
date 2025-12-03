import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onNotificationsTap;

  const DashboardAppBar({
    super.key,
    required this.onMenuTap,
    required this.onNotificationsTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF101022).withOpacity(0.8),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: onMenuTap,
      ),
      title: const Text(
        'Digital Twins Sync',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onNotificationsTap,
          icon: const Icon(
            Icons.notifications,
            size: 24,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}