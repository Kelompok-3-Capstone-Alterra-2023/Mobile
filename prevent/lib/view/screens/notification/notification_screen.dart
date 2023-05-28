import 'package:flutter/material.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(),
      body: Center(
        child: Text('NotificationScreen'),
      ),
    );
  }
}
