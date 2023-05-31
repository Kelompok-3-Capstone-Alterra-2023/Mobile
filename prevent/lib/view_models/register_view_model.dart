import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final primaryColor = const Color(0xff7CA153);

  bool obscureText = true;
  // tanggal
  List<DateTime?> _date = [
    DateTime.now(),
  ];
  final currentDate = DateTime.now();
  List<DateTime?> get date => _date;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void setDate(List<DateTime?> value) {
    _date = value;
    notifyListeners();
  }
}
