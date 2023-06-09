import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';

import '../../../view_models/settings_view_model.dart';
import '../login/login_screen.dart';

class WarningDeleteAccount extends StatelessWidget {
  const WarningDeleteAccount({super.key});

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: whiteColor,
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
          AppLocalizations.of(context)!.deleteAccount,
          // 'Hapus akun',
          style: GoogleFonts.inter(
            color: blackColor,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/warning_delete_account_image.png'),
            Text(
              AppLocalizations.of(context)!.titleWarningDeleteAccount,
              // 'Sebelum kamu menghapus akun, mohon pahami hal-hal berikut:',
              style: GoogleFonts.inter(fontSize: 15, fontWeight: bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Iconify(RadixIcons.dot_filled),
                Expanded(
                  child: Text(
                    provider.termsAndConditionsFirst,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Iconify(RadixIcons.dot_filled),
                Expanded(
                  child: Text(
                    provider.termsAndConditionsSecond,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Iconify(RadixIcons.dot_filled),
                Expanded(
                  child: Text(
                    provider.termsAndConditionsThird,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: colorStyleFifth),
                    child: Checkbox(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      activeColor: colorStyleFifth,
                      value: provider.agreeToTheTermsAndConditions,
                      onChanged: (value) {
                        provider.toggleTermsAndConditions();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  AppLocalizations.of(context)!.termsandConditions,
                  // 'Centang untuk menyetujui syarat dan ketentuan.',
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: bold),
                ),
              ],
            ),

            // Button Hapus AwesomeDialog
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 56,
                  child: AnimatedButton(
                    // text: "Hapus",
                    text: AppLocalizations.of(context)!.btnDelete,
                    color: dangerSecond,
                    borderRadius: BorderRadius.circular(10),
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        alignment: Alignment.centerLeft,
                        title: 'Keluar dari Akun Prevent?',
                        // desc:
                        //     'Jika kamu ingin menggunakan layanan prevent kembali, kamu perlu masuk ke akunmu lagi.',
                        desc: AppLocalizations.of(context)!.subTitleWarning,
                        // Action to perform on cancel and ok buttons
                        btnCancel: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              color: dangerSecond,
                              width: 2,
                            ),
                            backgroundColor: whiteColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.btnCancelled,
                            // 'Batal',
                            style: TextStyle(color: blackColor),
                          ),
                        ),
                        btnOk: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              color: dangerSecond,
                              width: 2,
                            ),
                            backgroundColor: dangerSecond,
                          ),
                          onPressed: () async {
                            debugPrint(provider.agreeToTheTermsAndConditions
                                .toString());

                            if (provider.agreeToTheTermsAndConditions == true) {
                              debugPrint(provider.agreeToTheTermsAndConditions
                                  .toString());
                              try {
                                await provider.deleteUser();
                                // Logic SharedPrefrences LogOut
                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Success'),
                                      content:
                                          const Text('Delete Account Success'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            logout(context);
                                          },
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                                color: colorStyleFifth),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                // logout(context);
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Delete Failed'),
                                    content: const Text(
                                        'Delete Account Failed, Please Try Again Later'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          'OK',
                                          style:
                                              TextStyle(color: colorStyleFifth),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    AppLocalizations.of(context)!
                                        .scaffoldWrning,
                                    // 'Harap centang untuk menyetujui syarat dan ketentuan.',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)!.logOut,
                            // 'Keluar',
                            style: TextStyle(color: whiteColor),
                          ),
                        ),
                      ).show();
                    },
                  ),
                ),
              ),
            ),
            // Button Hapus
            // Expanded(
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Container(
            //       margin: const EdgeInsets.only(bottom: 30),
            //       width: double.infinity,
            //       height: 56,
            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             backgroundColor: dangerSecond,
            //             shape: const RoundedRectangleBorder(
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(10)))),
            //         onPressed: () {
            //           print(provider.agreeToTheTermsAndConditions);
            //           // showDialog(
            //           //   context: context,
            //           //   builder: ((context) => AlertDialog(
            //           //         title: const Text('Keluar dari akun Prevent?'),
            //           //         content: const Text(
            //           //             'Jika kamu ingin menggunakan layanan prevent kembali, kamu perlu masuk ke akumu lagi.'),
            //           //         actions: <Widget>[
            //           //           ElevatedButton(
            //           //               style: ElevatedButton.styleFrom(
            //           //                   backgroundColor: whiteColor,
            //           //                   shape: RoundedRectangleBorder(
            //           //                       borderRadius:
            //           //                           BorderRadius.circular(10))),
            //           //               child: Text(
            //           //                 'Batal',
            //           //                 style: TextStyle(color: blackColor),
            //           //               ),
            //           //               onPressed: () {}),
            //           //           TextButton(
            //           //               child: const Text('Button 2'),
            //           //               onPressed: () {}),
            //           //         ],
            //           //       )),
            //           // );
            //           // logic validator, harus checklist agar bisa Lanjut ke halaman selanjutnya
            //           if (provider.agreeToTheTermsAndConditions == false) {
            //             // Navigator.push(context, MaterialPageRoute(builder: (_) => ));
            //           }
            //         },
            //         child: Text(
            //           'Hapus',
            //           style:
            //               GoogleFonts.poppins(fontWeight: bold, fontSize: 16),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
