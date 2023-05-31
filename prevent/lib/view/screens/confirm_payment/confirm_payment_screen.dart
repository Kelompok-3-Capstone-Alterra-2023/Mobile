import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/widgets/timer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ConfirmPayment extends StatefulWidget {
  ConfirmPayment({Key? key}) : super(key: key);

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  @override
  Widget build(BuildContext context) {
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
          'Verivikasi Pembayaran',
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
                  'Lakukan Pembayaran Dalam',
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
                      'Nomor Transaksi',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
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
                      'Status Pembayaran',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      'Berhasil',
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
                      'Email',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      'Anonymous@gmail.com',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Waktu Transaksi',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      '21 Agustus 2023 20:11:17',
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
                      'Total Pembayaran',
                      style:
                          GoogleFonts.poppins(fontWeight: bold, fontSize: 15),
                    ),
                    Text(
                      'Rp202.000',
                      style:
                          GoogleFonts.poppins(fontWeight: bold, fontSize: 15),
                    ),
                  ],
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
                            'Metode Pembayaran',
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
                        'Scan kode QR / download QR / screenshoot QR dibawah ini dengan aplikasi digital wallet untuk membayar',
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: reguler),
                      ),
                      Center(
                        child: QrImageView(
                          data: 'testing',
                          version: QrVersions.auto,
                          size: 150,
                        ),
                      ),
                      Text(
                        'Catatan',
                        style:
                            GoogleFonts.poppins(fontWeight: bold, fontSize: 10),
                      ),
                      Text(
                        '1. Mohon diingat agar membayar sebelum timer waktu habis!\n 2. Jika timer waktu telah habis, maka user dapat memesan ulang transaksi yang dipilih\n 3. Halaman akan ter-refresh secara otomatis jika terdapat perubahan status.\n4. Mohon lakukan pembayaran sesuai dengan nominal yang tertera\n5. Proses konfirmasi pembayaran otomatis 1-5 menit setelah melakukan pembayaran.',
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
