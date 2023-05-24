import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/theme.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

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
          'Hapus akun',
          style: GoogleFonts.inter(
            color: blackColor,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
