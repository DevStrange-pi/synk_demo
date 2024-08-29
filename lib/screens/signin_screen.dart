import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'signup_screen.dart';

class SignInScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: authController.signInFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => {}, // Forgot Password Functionality
                  child: Text("Forgot Password?"),
                ),
              ),
              ElevatedButton(
                onPressed: () => authController.signIn(),
                child: Text("Sign In"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.g_translate)),
                ],
              ),
              TextButton(
                onPressed: () => Get.to(SignUpScreen()),
                child: Text("Create an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}