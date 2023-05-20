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
  DateTime _date = DateTime.now();
  final currentDate = DateTime.now();
  DateTime get date => _date;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void updateDate(DateTime selectDate) {
    _date = selectDate;
    notifyListeners();
  }

  Future<void> selectDate(
      BuildContext context, RegisterViewModel provider) async {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme.copyWith(
      primary: primaryColor,
      onPrimary: Colors.white,
    );
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      provider.updateDate(pickedDate);
    }
  }
}
