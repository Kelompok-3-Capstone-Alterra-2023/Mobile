import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/view/screens/settings/delete_account.dart';
import 'package:prevent/view/screens/settings/notification_settings.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';

class UserAccountSettings extends StatelessWidget {
  const UserAccountSettings({super.key});

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
          AppLocalizations.of(context)!.useraccountsetting,
          // 'Pengaturan akun user',
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
                // Navigasi ke Delete Account
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DeleteAccount()),
                );
              },
              child: SizedBox(
                height: 80,
                child: Card(
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.delete_outlined,
                        color: blackColor,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.deleteAccount,
                        // 'Hapus akun',
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
                // Navigasi ke Pengaturan Notifikasi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NotificationSettings()),
                );
              },
              child: SizedBox(
                height: 80,
                child: Card(
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications_none_outlined,
                        color: blackColor,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.notificationSettings,
                        // 'Pengaturan Notifikasi',
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
          ],
        ),
      ),
    );
  }
}
