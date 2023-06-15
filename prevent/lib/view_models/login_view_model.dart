import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/user_api.dart';

class LoginViewModel extends ChangeNotifier {
  final UserApiService apiService = UserApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<String> loginUser(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = await apiService.loginUser(email, password);

      // Menyimpan token ke Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      _isLoading = false;
      notifyListeners();
      return token;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
