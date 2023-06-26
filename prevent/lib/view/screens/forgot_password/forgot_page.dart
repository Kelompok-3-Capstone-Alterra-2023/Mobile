import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/forgot_password/reset_page.dart';
import 'package:prevent/view/screens/login/login_screen.dart';

import '../../../util/common.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

final _emailController = TextEditingController();

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          Container(
            margin: const EdgeInsets.all(9),
            color: Colors.grey,
            height: MediaQuery.of(context).size.height / 2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 43, right: 43, bottom: 11),
            child: Text(
              AppLocalizations.of(context)!.forgotPassFirst,
              // 'Lupa Password?',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: colorStyleSeventh,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 43, right: 43, bottom: 30),
            child: Text(
              AppLocalizations.of(context)!.forgotPassSecond,
              // 'Jangan khawatir, Silahkan masukkan alamat email yang kamu gunakan di akunmu ya!',
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    color: colorStyleFifth,
                  ),
                ),
                label: Text(
                  AppLocalizations.of(context)!.forgotPassThird,
                  // 'Email',
                  style: GoogleFonts.poppins(
                      fontWeight: reguler, color: blackColor),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 50),
                  ),
                  backgroundColor: MaterialStateProperty.all(colorStyleFifth)),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassScreen())),
              child: Text(
                AppLocalizations.of(context)!.forgotPassFourth,
                // 'Lanjut',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
