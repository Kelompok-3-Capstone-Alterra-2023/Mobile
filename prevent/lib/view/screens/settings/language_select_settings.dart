import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';

class LanguageSelectSettings extends StatelessWidget {
  const LanguageSelectSettings({super.key});

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
          AppLocalizations.of(context)!.selectLanguages,
          // 'Pilihan Bahasa',
          style: GoogleFonts.inter(
            color: blackColor,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Card(
                child: Center(
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(
                      AppLocalizations.of(context)!.indonesiaLanguage,
                      // 'Bahasa Indonesia',
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
            SizedBox(
              height: 80,
              child: Card(
                child: Center(
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(
                      AppLocalizations.of(context)!.englishLanguage,
                      // 'Bahasa Inggris',
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
      ),
    );
  }
}
