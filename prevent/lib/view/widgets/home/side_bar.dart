import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/models/profile_model.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/help_center/help_center_screen.dart';
import 'package:prevent/view/screens/login/login_screen.dart';
import 'package:prevent/view/screens/settings/settings_screen.dart';
import 'package:prevent/view_models/home_view_model.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:prevent/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';
import '../../screens/doctor_favorite/doctor_favorite_screem.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffe3f6cd),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 40, top: 40, right: 40, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Consumer<ProfileViewModel>(
              builder: (context, value, _) {
                if (context.read<LoginViewModel>().isLogin) {
                  UserProfile profile = value.userProfile;
                  return ListTile(
                    title: RichText(
                        text: TextSpan(
                            text: profile.username,
                            style: GoogleFonts.inter(
                                color: const Color(0xff2F5146),
                                fontWeight: semiBold,
                                fontSize: 15),
                            children: [
                          TextSpan(
                              text: '\n${profile.email}',
                              style: GoogleFonts.inter(fontWeight: reguler))
                        ])),
                  );
                }
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text('Sign In'),
                );
              },
            ),
            const SizedBox(
              height: 77,
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/favorite_outline.svg',
                color: const Color(0xff2F5146),
              ),
              title: Text(
                AppLocalizations.of(context)!.sideBarFirst,
                // 'Dokter Favorite',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                // Tindakan yang akan dijalankan saat menu 1 diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const DoctorFavoriteScreen()),
                );
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/doctor_outline.svg',
                color: const Color(0xff2F5146),
              ),
              title: Text(
                AppLocalizations.of(context)!.sideBarSecond,
                // 'Konsultasi Berjalan',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                Navigator.of(context).pop();
                context.read<HomeViewModel>().selectedIndex = 1;
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/settings_outline.svg',
                color: const Color(0xff2F5146),
              ),
              title: Text(
                AppLocalizations.of(context)!.sideBarThird,
                // 'Pengaturan',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                // Tindakan yang akan dijalankan saat menu 1 diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/help_outline.svg',
                color: const Color(0xff2F5146),
              ),
              title: Text(
                AppLocalizations.of(context)!.sideBarFourth,
                // 'Pusat Bantuan',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpCenterScreen(),
                    ));
              },
            ),
            const Spacer(),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.sideBarFifth,
                // 'Version 1.0.1',
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
