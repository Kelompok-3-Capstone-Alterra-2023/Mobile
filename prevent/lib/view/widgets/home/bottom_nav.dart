import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../util/common.dart';
import '../../../util/theme.dart';
import '../../../view_models/home_view_model.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context, listen: true);
    return Container(
      height: 74,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorNavBar,
            width: 0.5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: whiteColor,
        currentIndex: provider.selectedIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: provider.selectedIndex == 0
                  ? colorNavBar
                  : colorUnselectedNavBar,
            ),
            // label: 'Beranda',
            label: AppLocalizations.of(context)!.btmNavBarHome,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/riwayat_konsul.svg',
              color: provider.selectedIndex == 1
                  ? colorNavBar
                  : colorUnselectedNavBar,
            ),
            // label: 'Riwayat Konsultasi',
            label: AppLocalizations.of(context)!.btmNavBarHistory,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notif.svg',
              color: provider.selectedIndex == 2
                  ? colorNavBar
                  : colorUnselectedNavBar,
            ),
            // label: 'Notifikasi',
            label: AppLocalizations.of(context)!.btmNavBarNotif,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profil.svg',
              color: provider.selectedIndex == 3
                  ? colorNavBar
                  : colorUnselectedNavBar,
            ),
            // label: 'Profil',
            label: AppLocalizations.of(context)!.btmNavBarProfil,
          ),
        ],
        onTap: (value) => provider.selectedIndex = value,
        selectedItemColor: colorNavBar,
      ),
    );
  }
}
