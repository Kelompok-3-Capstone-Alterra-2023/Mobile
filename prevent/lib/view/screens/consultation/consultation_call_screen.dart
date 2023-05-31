import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/widgets/alert_dialog.dart';
import 'package:prevent/view/widgets/timer.dart';

class ConsultationCallScreen extends StatefulWidget {
  ConsultationCallScreen({Key? key}) : super(key: key);

  @override
  State<ConsultationCallScreen> createState() => _ConsultationCallScreenState();
}

class _ConsultationCallScreenState extends State<ConsultationCallScreen> {
  ResepAlert dialog = ResepAlert();
  DialogCloseSession dialogClose = DialogCloseSession();
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
            )),
        title: Text(
          'Nama dokter',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: blackColor),
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
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/doctor_image.png')),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fauzan',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      'Psikolog Klinis',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      'Trauma, Stress, Depresi',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: reguler),
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
          Text(
            'Waktu Konsultasi',
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: bold),
          ),
          const AppTimer(
            start: 3600,
            size: 20,
            fontColor: Colors.red,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Konsultasi dengan Dokter',
              style: GoogleFonts.poppins(fontSize: 10, fontWeight: bold),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 65),
            child: Text(
              'Mohon diingat bahwa sesi konsultasi dengan dokter bersifat tertutup dan konsultasi anda dengan dokter bersifat pribadi dan hanya bersifat 2 arah, kami mengimbau user untuk berbicara dengan dokter dengan sepenuh hati dan tanpa perlu ditahan. Sehat selalu!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 10, fontWeight: reguler),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              '+62 888 2323 4444',
              style: GoogleFonts.poppins(fontSize: 32, fontWeight: bold),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 65),
            child: Text(
              'User dipersilahkan untuk menghubungi dokter melalui nomor tersebut, dimohon kepada user untuk berkonsultasi dengan dokter tepat waktu.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 10, fontWeight: reguler),
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       showDialog(
          //           context: context,
          //           builder: (context) {
          //             return dialogClose;
          //           });
          //     },
          //     child: const Text('test'))
        ],
      ),
    );
  }
}
