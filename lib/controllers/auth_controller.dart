import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/dashboard_screen.dart';
import '../screens/signin_screen.dart';
import '../utils/validators.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  var acceptTerms = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkSession();
  }

  void _checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }

  void signIn() async {
    if (signInFormKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('email', emailController.text);
      isLoggedIn.value = true;
      Get.offAll(() => DashboardScreen());
    }
  }

  void signUp() async {
    if (signUpFormKey.currentState!.validate() && acceptTerms.value) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('email', emailController.text);
      isLoggedIn.value = true;
      Get.offAll(() => DashboardScreen());
    } else {
      Get.snackbar('Error', 'Please accept the terms and conditions.');
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
    Get.offAll(() => SignInScreen());
  }

  String? validateEmail(String? value) {
    return Validators.validateEmail(value);
  }

  String? validatePassword(String? value) {
    return Validators.validatePassword(value);
  }

  String? validateName(String? value) {
    return Validators.validateName(value);
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return Validators.validatePassword(value);
  }
}