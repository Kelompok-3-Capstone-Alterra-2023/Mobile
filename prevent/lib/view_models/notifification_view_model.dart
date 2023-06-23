import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:prevent/models/notification_payment_model.dart';
import '../models/notification_consultation_model.dart';

class NotificationViewModel extends ChangeNotifier {
  List<NotificationConsultation> consultations = [];
  List<NotificationPayment> payments = [];

  List<NotificationConsultation> filteredConsultations = [];
  List<NotificationPayment> filteredPayments = [];

  String searchText = '';

  Future<void> getNotificationConsul() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/notification.json');
      final jsonList = json.decode(jsonString)['consultations'];
      consultations = jsonList
          .map<NotificationConsultation>(
              (json) => NotificationConsultation.fromJson(json))
          .toList();
    } catch (error) {
      debugPrint('Failed to load consultations: $error');
    }
    // Set data awal yang tidak difilter
    filteredConsultations = consultations;
    filteredPayments = payments;

    notifyListeners();
  }

  Future<void> getNotificationPayment() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/notification.json');
      final jsonList = json.decode(jsonString)['payments'];
      payments = jsonList
          .map<NotificationPayment>(
              (json) => NotificationPayment.fromJson(json))
          .toList();
    } catch (error) {
      debugPrint('Failed to load payments: $error');
    }

    notifyListeners();
  }

  void setSearchText(String text) {
    searchText = text;
    filterData();
  }

  void filterData() {
    filteredConsultations = consultations.where((consultation) {
      final message = consultation.message.toLowerCase();
      final title = consultation.title.toLowerCase();
      final searchLower = searchText.toLowerCase();

      return message.contains(searchLower) || title.contains(searchLower);
    }).toList();

    filteredPayments = payments.where((payment) {
      final message = payment.message.toLowerCase();
      final title = payment.title.toLowerCase();
      final searchLower = searchText.toLowerCase();

      return message.contains(searchLower) || title.contains(searchLower);
    }).toList();

    notifyListeners();
  }
}
