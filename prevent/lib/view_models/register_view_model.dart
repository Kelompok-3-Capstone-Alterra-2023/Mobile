import 'package:flutter/material.dart';

import '../services/user_api.dart';

class RegisterViewModel extends ChangeNotifier {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  // date
  List<DateTime?> _date = [
    DateTime.now(),
  ];
  final currentDate = DateTime.now();
  List<DateTime?> get date => _date;

  final UserApiService apiService = UserApiService();

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void setDate(List<DateTime?> value) {
    _date = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingOtp = false;
  bool get isLoadingOtp => _isLoadingOtp;

  bool _isRegisterSuccess = false;
  bool _isOTPVerificationSuccess = false;

  bool get isRegisterSuccess => _isRegisterSuccess;
  bool get isOTPVerificationSuccess => _isOTPVerificationSuccess;

  Future<void> registerUser(
      String email, String username, String password, String birthdate) async {
    _isLoading = true;
    notifyListeners();

    try {
      _isRegisterSuccess =
          await apiService.registerUser(email, username, password, birthdate);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> checkOtp(String email, String username, String password,
      String birthdate, String otp) async {
    _isLoadingOtp = true;
    notifyListeners();

    try {
      _isOTPVerificationSuccess =
          await apiService.checkOtp(email, username, password, birthdate, otp);

      _isLoadingOtp = false;
      notifyListeners();
    } catch (e) {
      _isLoadingOtp = false;
      notifyListeners();
      rethrow;
    }
  }
}
