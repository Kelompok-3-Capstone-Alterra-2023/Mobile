import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
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

    void onItemTapped(int index) {
      provider.selectedIndex = index;
    }

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
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/riwayat_konsul.svg',
              color: provider.selectedIndex == 1
                  ? colorNavBar
                  : colorUnselectedNavBar,
            ),
            label: 'Riwayat Konsultasi',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notif.svg',
              color: provider.selectedIndex == 2
                  ? colorNavBar
                  : colorUnselectedNavBar,
            ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profil.svg',
              color: provider.selectedIndex == 3
                  ? colorNavBar
                  : colorUnselectedNavBar,
            ),
            label: 'Profil',
          ),
        ],
        onTap: onItemTapped,
        selectedItemColor: colorNavBar,
        // unselectedItemColor: const Color(0XFF696767),
      ),
    );
  }
}
