import 'package:flutter/material.dart';

class PaymentViewModel extends ChangeNotifier {
  String selectedRadio = 'qris';

  setSelectedRadio(String value) {
    selectedRadio = value;
    notifyListeners();
  }
}
