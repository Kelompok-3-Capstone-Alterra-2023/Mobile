import 'package:flutter/material.dart';
import 'package:prevent/util/common.dart';
import 'package:prevent/view/screens/home/home_screen.dart';
import 'package:prevent/view_models/home_view_model.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:prevent/view_models/register_view_model.dart';
import 'package:prevent/view_models/settings_view_model.dart';
import 'package:prevent/view/screens/on_boarding/on_boarding.dart';
import 'package:prevent/view_models/search_article_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final login = LoginViewModel();
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
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchArticleViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Prevent',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: login.isLogin ? const OnBoarding() : const HomeScreen(),
      ),
    );
  }
}
