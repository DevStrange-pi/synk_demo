import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: authController.signUpFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: authController.nameController,
                validator: authController.validateName,
                decoration: InputDecoration(labelText: "Name"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                controller: authController.emailController,
                validator: authController.validateEmail,
                decoration: InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                controller: authController.passwordController,
                validator: authController.validatePassword,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                controller: authController.confirmPasswordController,
                validator: authController.validateConfirmPassword,
                decoration: InputDecoration(labelText: "Confirm Password"),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Obx(() => CheckboxListTile(
                    title: Text("I accept the Terms and Conditions"),
                    value: authController.acceptTerms.value,
                    onChanged: (newValue) {
                      authController.acceptTerms.value = newValue!;
                    },
                  )),
              ElevatedButton(
                onPressed: () => authController.signUp(),
                child: Text("Sign Up"),
              ),
              TextButton(
                onPressed: () => Get.to(SignInScreen()),
                child: Text("Already have an account? Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}