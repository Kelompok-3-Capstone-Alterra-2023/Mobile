import 'package:flutter/material.dart';
import 'package:prevent/view/screens/home/home_page.dart';
import '../view/screens/consultation_history/consultation_history_screen.dart';
import '../view/screens/notification/notification_screen.dart';
import '../view/screens/profile/profile_screen.dart';

class HomeViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    if (_selectedIndex != value) {
      _selectedIndex = value;
      notifyListeners();
    }
  }

  Widget? boddy() {
    switch (selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ConsultationHistoryScreen();
      case 2:
        return const NotificationScreen();
      case 3:
        return const ProfileScreen();
    }
    return null;
  }
}
