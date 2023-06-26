import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/forgot_password/forgot_page.dart';

import '../../../util/common.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

final ValueNotifier<bool> obscureNew = ValueNotifier(true);
final ValueNotifier<bool> obscureConfirm = ValueNotifier(true);

class _ResetPassScreenState extends State<ResetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ForgotPassScreen()));
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
            margin: const EdgeInsets.only(left: 27, right: 27, bottom: 11),
            child: Text(
              AppLocalizations.of(context)!.resetFirst,
              // 'Atur Ulang Password',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: colorStyleSeventh,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
            child: ValueListenableBuilder(
              valueListenable: obscureNew,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: obscureNew.value,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: colorStyleFifth,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(obscureNew.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        obscureNew.value = !obscureNew.value;
                      },
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.resetSecond,
                      // 'Kata Sandi Baru',
                      style: GoogleFonts.poppins(
                          fontWeight: reguler, color: blackColor),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: ValueListenableBuilder(
              valueListenable: obscureConfirm,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: obscureConfirm.value,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: colorStyleFifth,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(obscureConfirm.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        obscureConfirm.value = !obscureConfirm.value;
                      },
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.resetThird,
                      // 'Ulangi Kata Sandi',
                      style: GoogleFonts.poppins(
                          fontWeight: reguler, color: blackColor),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                );
              },
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
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.resetFourth,
                // 'Kirim',
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
