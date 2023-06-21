import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/view/screens/settings/dropdown/drop_down.dart';
import 'package:prevent/view/screens/settings/warning_delete_account_screen.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';
import '../../../view_models/settings_view_model.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  // @override
  // void initState() {
  //   final provider = Provider.of<SettingsViewModel>(context, listen: false);

  //   // selectedCause = causeList[0];
  //   provider.firstState();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsViewModel>(context, listen: true);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.reasonForDeletingAccount,
              // 'Mengapa kamu ingin menghapus akun?',
              style: GoogleFonts.inter(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 20,
            ),
            const DropDown(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorStyleFifth,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () {
                      // logic validator, harus mengisi dropdown agar bisa Lanjut ke halaman selanjutnya
                      if (provider.groupValue != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const WarningDeleteAccount()));
                        debugPrint(provider.groupValue.toString());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(context)!.inputReason,
                              // 'Harap masukan alasan Anda!',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.continuee,
                      // 'Lanjut',
                      style:
                          GoogleFonts.poppins(fontWeight: bold, fontSize: 16),
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
