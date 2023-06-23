import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:prevent/util/common.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/article/search_article_screen.dart';
import 'package:prevent/view/screens/view_all_doctor/custom_search.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:prevent/view_models/profile_view_model.dart';
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
  void initState() {
    super.initState();
    context.read<ProfileViewModel>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context, listen: true);
    final bool isLogin = context.read<LoginViewModel>().isLogin;
    PreferredSizeWidget? handleAppBar(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  padding: const EdgeInsets.only(left: 10),
                  icon: Iconify(
                    Ph.list,
                    size: 36,
                    color: whiteColor,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            elevation: 0,
            title: Image.asset('assets/images/logo_app.png'),
            centerTitle: true,
            backgroundColor: colorStyleFifth,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchArticleScreen(),
                    ),
                  );
                },
                icon: Iconify(
                  Ri.search_line,
                  size: 24,
                  color: whiteColor,
                ),
              ),
            ],
          );
        case 1:
          return AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  padding: const EdgeInsets.only(left: 10),
                  icon: const Iconify(
                    Ph.list,
                    size: 36,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.consultationHistory,
              // 'Riwayat Konsultasi',
              style: TextStyle(color: blackColor),
            ),
            centerTitle: true,
            backgroundColor: whiteColor,
            elevation: 0,
            actions: [
              if (isLogin)
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: Iconify(
                    Ri.search_line,
                    color: blackColor,
                  ),
                )
            ],
          );
        case 2:
          return AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  padding: const EdgeInsets.only(left: 10),
                  icon: const Iconify(
                    Ph.list,
                    size: 36,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.notificationFirst,
              // 'Notifikasi',
              style: TextStyle(color: blackColor),
            ),
            centerTitle: true,
            backgroundColor: whiteColor,
            elevation: 0,
            actions: [
              if (isLogin)
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: Iconify(
                    Ri.search_line,
                    color: blackColor,
                  ),
                )
            ],
          );
        default:
          return AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  padding: const EdgeInsets.only(left: 10),
                  icon: const Iconify(
                    Ph.list,
                    size: 36,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.profileFirst,
              // 'Profile',
              style: GoogleFonts.inter(fontSize: 16, fontWeight: semiBold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: whiteColor,
            foregroundColor: blackColor,
          );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: handleAppBar(provider.selectedIndex),
      key: provider.scaffoldKey,
      drawer: const SideBar(),
      body: provider.boddy(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
