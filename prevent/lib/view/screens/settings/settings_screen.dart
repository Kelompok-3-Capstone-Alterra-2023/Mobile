import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/settings/user_account_settings_screen.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/common.dart';
import '../login/login_screen.dart';
import 'language_select_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  final login = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: whiteColor,
        title: Text(
          AppLocalizations.of(context)!.settings,
          // 'Pengaturan',
          style: GoogleFonts.inter(
            color: blackColor,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // Navigasi ke Pengaturan Akun User
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const UserAccountSettings()),
                );
              },
              child: SizedBox(
                height: 80,
                child: Card(
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.manage_accounts_outlined,
                        color: blackColor,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.useraccountsetting,
                        // 'Pengaturan akun user',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right_rounded,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // Navigasi ke Pengaturan Pilihan Bahasa
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const LanguageSelectSettings()),
                );
              },
              child: SizedBox(
                height: 80,
                child: Card(
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.language_rounded,
                        color: blackColor,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.languageOptions,
                        // 'Pilihan Bahasa',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right_rounded,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                logout(context);
                login.logout();
              },
              child: Text(
                AppLocalizations.of(context)!.logOut,
                // 'Keluar',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: bold,
                  color: const Color(0XFFC73830),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizations.of(context)!.applicationVersion,
              // 'Versi aplikasi 1.1.1',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
