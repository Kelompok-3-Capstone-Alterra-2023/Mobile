import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/consultation/consultation_call_screen.dart';
import 'package:prevent/view/screens/consultation/consultation_chat_screen.dart';
import 'package:prevent/view/widgets/timer.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../models/doctor_model.dart';
import '../../../models/profile_model.dart';
import '../../../util/common.dart';
import '../../../view_models/profile_view_model.dart';

class ConfirmPayment extends StatefulWidget {
  final Doctor doctor;
  final String timeTransaction;
  final String typeConsul;
  const ConfirmPayment(
      {Key? key,
      required this.typeConsul,
      required this.doctor,
      required this.timeTransaction})
      : super(key: key);
  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  String textStatus = 'Menunggu Pembayaran';
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(seconds: 8), () {
      setState(() {
        if (widget.typeConsul == 'chat') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ConsultationChatScreen(
                        idDoctor: widget.doctor.id,
                        doctor: widget.doctor,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ConsultationCallScreen(
                        doctor: widget.doctor,
                        timeTransaction: widget.timeTransaction,
                      )));
        }
      });
    });

    Timer(const Duration(seconds: 5), () {
      setState(() {
        textStatus = 'Berhasil'; // Mengubah teks setelah 5 detik
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileViewModel>(context);
    UserProfile profile = provider.userProfile;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 18,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: blackColor,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.confirmPaymentFirst,
          // 'Verifikasi Pembayaran',
          style: GoogleFonts.inter(
              fontWeight: semiBold, color: Colors.black, fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
      ),
      body: Column(
        children: [
          const Divider(
            thickness: 5,
            color: Color(0xffececec),
          ),
          Container(
            padding: const EdgeInsetsDirectional.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.confirmPaymentSecond,
                  // 'Lakukan Pembayaran Dalam',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const AppTimer(start: 3600)
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: Color(0xffececec),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.confirmPaymentThird,
                      // 'Nomor Transaksi',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      // AppLocalizations.of(context)!.telephoneMethod,
                      '123ECD456',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.confirmPaymentFourth,
                      // 'Status Pembayaran',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      textStatus,
                      style: GoogleFonts.poppins(
                          color: colorStyleSeventh,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.titleEmail,
                      // 'Email',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      profile.email,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.confirmPaymentFifth,
                      // 'Waktu Transaksi',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      widget.timeTransaction,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: Color(0xffececec),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.confirmPaymentSeventh,
                      // 'Total Pembayaran',
                      style:
                          GoogleFonts.poppins(fontWeight: bold, fontSize: 15),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'IDR')
                          .format(widget.doctor.price + 2000),
                      style:
                          GoogleFonts.poppins(fontWeight: bold, fontSize: 15),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.confirmPaymentEighth,
                        // 'Lihat Rincian',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: reguler),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.confirmPaymentNineth,
                            // 'Metode Pembayaran',
                            style: GoogleFonts.poppins(
                                fontWeight: bold, fontSize: 15),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Qris.png',
                                width: 64,
                                height: 32,
                              ),
                              Text(
                                'QRIS',
                                style: GoogleFonts.poppins(
                                    fontWeight: reguler, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        AppLocalizations.of(context)!.confirmPaymentTenth,
                        // 'Scan kode QR / download QR / screenshoot QR dibawah ini dengan aplikasi digital wallet untuk membayar',
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: reguler),
                      ),
                      Center(
                        child: QrImageView(
                          data: 'testing',
                          version: QrVersions.auto,
                          size: MediaQuery.of(context).size.height / 5,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.confirmPaymentEleventh,
                        // 'Catatan',
                        style:
                            GoogleFonts.poppins(fontWeight: bold, fontSize: 10),
                      ),
                      Text(
                        AppLocalizations.of(context)!.confirmPaymentTwelfth,
                        // '1. Mohon diingat agar membayar sebelum timer waktu habis!\n 2. Jika timer waktu telah habis, maka user dapat memesan ulang transaksi yang dipilih\n 3. Halaman akan ter-refresh secara otomatis jika terdapat perubahan status.\n4. Mohon lakukan pembayaran sesuai dengan nominal yang tertera\n5. Proses konfirmasi pembayaran otomatis 1-5 menit setelah melakukan pembayaran.',
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: reguler),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
