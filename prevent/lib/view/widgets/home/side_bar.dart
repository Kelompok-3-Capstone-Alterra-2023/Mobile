import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/settings/settings_screen.dart';

import '../../../util/common.dart';

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
            ListTile(
              title: RichText(
                  text: TextSpan(
                      text: 'Nama Pengguna',
                      style: GoogleFonts.inter(
                          color: const Color(0xff2F5146),
                          fontWeight: semiBold,
                          fontSize: 15),
                      children: [
                    TextSpan(
                        text: '\nEmailUser@email.com',
                        style: GoogleFonts.inter(fontWeight: reguler))
                  ])),
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
                AppLocalizations.of(context)!.favoriteDoctorSideBar,
                // 'Dokter Favorite',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                // Tindakan yang akan dijalankan saat menu 1 diklik
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/doctor_outline.svg',
                color: const Color(0xff2F5146),
              ),
              title: Text(
                AppLocalizations.of(context)!.ongoingConsultationSideBar,
                // 'Konsultasi Berjalan',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                // Tindakan yang akan dijalankan saat menu 1 diklik
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/settings_outline.svg',
                color: const Color(0xff2F5146),
              ),
              title: Text(
                AppLocalizations.of(context)!.settingsSideBar,
                // 'Pengaturan',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                // Tindakan yang akan dijalankan saat menu 1 diklik
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SettingsScreen()));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/help_outline.svg',
                color: const Color(0xff2F5146),
              ),
              title: Text(
                AppLocalizations.of(context)!.helpCenterSideBar,
                // 'Pusat Bantuan',
                style: GoogleFonts.inter(
                    color: const Color(0xff2F5146),
                    fontSize: 15,
                    fontWeight: medium),
              ),
              onTap: () {
                // Tindakan yang akan dijalankan saat menu 1 diklik
              },
            ),
            const Spacer(),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.versionSideBar,
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
