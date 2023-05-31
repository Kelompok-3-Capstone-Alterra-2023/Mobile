import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
