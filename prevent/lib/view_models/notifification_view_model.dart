import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:prevent/models/notification_payment_model.dart';
import '../models/notification_consultation_model.dart';

class NotificationViewModel extends ChangeNotifier {
  List<NotificationConsultation> consultations = [];
  List<NotificationPayment> payments = [];

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
}
