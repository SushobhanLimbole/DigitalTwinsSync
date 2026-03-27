import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/app_theme.dart';
import 'screens/main_screen.dart';
import 'controllers/task_controller.dart';
import 'controllers/digital_twin_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Registering GetX Controllers
  Get.put(TaskController());
  Get.put(DigitalTwinController());

  runApp(const DigitalTwinsApp());
}

class DigitalTwinsApp extends StatelessWidget {
  const DigitalTwinsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Digital Twins Sync',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
