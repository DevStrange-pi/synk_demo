import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'screens/dashboard_screen.dart';
import 'screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Obx(() {
        return authController.isLoggedIn.value
            ? DashboardScreen()
            : SignInScreen();
      }),
    );
  }
}