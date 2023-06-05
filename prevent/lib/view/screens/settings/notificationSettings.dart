import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

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
          AppLocalizations.of(context)!.notificationSettings,
          // 'Pengaturan notifikasi',
          style: GoogleFonts.inter(
            color: blackColor,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Card(
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    color: blackColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.appNotifications,
                    // 'Notifikasi di aplikasi',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  trailing: Switch(
                    value: true,
                    activeColor: Color(0XFF2D6248),
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
