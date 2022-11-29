import 'package:flutter/material.dart';
import 'package:login_signup_ui/screens/login_signup_screen.dart';

void main() {
  runApp(LoginSignupUi());
}

class LoginSignupUi extends StatelessWidget {
  const LoginSignupUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Signup Ui",
      home: LoginSignupScreen(),
    );
  }
}