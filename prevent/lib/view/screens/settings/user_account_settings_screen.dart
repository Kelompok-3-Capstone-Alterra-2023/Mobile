import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/view/screens/settings/delete_account.dart';

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
          'Pengaturan akun user',
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
                  MaterialPageRoute(builder: (_) => DeleteAccount()),
                );
              },
              child: SizedBox(
                height: 80,
                child: Card(
                  child: Center(
                    child: ListTile(
                      leading: const Icon(Icons.delete_outlined),
                      title: Text(
                        'Hapus akun',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // Navigasi ke Pengaturan Akun User
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserAccountSettings()),
                );
              },
              child: SizedBox(
                height: 80,
                child: Card(
                  child: Center(
                    child: ListTile(
                      leading: const Icon(Icons.notifications_none_outlined),
                      title: Text(
                        'Pengaturan Notifikasi',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
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
