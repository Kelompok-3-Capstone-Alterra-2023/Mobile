import 'package:flutter/material.dart';
import 'package:prevent/view/screens/view_all_doctor/view_all_doctor_screen.dart';
import 'package:prevent/view/screens/home/home_screen.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:prevent/view_models/register_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:prevent/view/screens/on_boarding/on_boarding.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Prevent',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const ViewAllDoctorScreen(),
      ),
    );
  }
}
