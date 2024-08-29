import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import 'home_screen.dart';
import 'orders_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: dashboardController.currentIndex.value,
          onTap: dashboardController.changeTabIndex,
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: dashboardController.currentIndex.value,
          children: [
            HomeScreen(),
            OrdersScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}