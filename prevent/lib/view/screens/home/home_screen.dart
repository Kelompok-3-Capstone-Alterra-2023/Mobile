import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/simple_line_icons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';
import 'package:provider/provider.dart';
import '../../../view_models/home_view_model.dart';
import '../../widgets/home/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context, listen: true);

    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: provider.scaffoldKey,
      appBar: AppBar(
        backgroundColor: colorStyleFifth,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            provider.scaffoldKey.currentState!.openDrawer();
          },
          icon: Iconify(
            SimpleLineIcons.menu,
            color: whiteColor,
            size: 30,
          ),
        ),
        title: Image.asset(
          'assets/images/text_logo.png',
          width: 128,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Fitur Search
            },
            icon: Iconify(
              Eva.search_outline,
              color: whiteColor,
              size: 45,
            ),
          ),
        ],
      ),
      body: provider.boddy(),
      drawer: const SideBar(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
