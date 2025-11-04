import 'package:digital_twins/features/automation/view/automation_screen.dart';
import 'package:digital_twins/features/dashboard/view/dashboard_screen.dart';
import 'package:digital_twins/features/insights/view/productivity_insights_screen.dart';
import 'package:digital_twins/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Twins Sync Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1313EC),
          surface: Color(0xFF101022),
          background: Color(0xFF101022),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF101022),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
      ),
      home: const DigitalTwinsDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
