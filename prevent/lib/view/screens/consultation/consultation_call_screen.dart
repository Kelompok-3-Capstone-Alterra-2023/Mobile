import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/widgets/alert_dialog.dart';

import '../../../models/doctor_model.dart';
import '../../../util/common.dart';

class ConsultationCallScreen extends StatefulWidget {
  const ConsultationCallScreen(
      {Key? key, required this.doctor, required this.timeTransaction})
      : super(key: key);
  final Doctor doctor;
  final String timeTransaction;

  @override
  State<ConsultationCallScreen> createState() => _ConsultationCallScreenState();
}

class _ConsultationCallScreenState extends State<ConsultationCallScreen> {
  ResepAlert dialog = const ResepAlert();
  DialogCloseSession dialogClose = const DialogCloseSession();
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
          AppLocalizations.of(context)!.consultationCallFirst,
          // 'Nama dokter',
          style: TextStyle(fontSize: 15, fontWeight: bold, color: blackColor),
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
                  child: widget.doctor.propic.isEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/doctor1.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.doctor.propic,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor.fullName,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      widget.doctor.specialist,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      widget.doctor.description,
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: reguler),
                    ),
                    Row(
                      children: [
                        const Iconify(
                          Mdi.clock,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          widget.timeTransaction,
                          style: TextStyle(fontSize: 10, fontWeight: reguler),
                        )
                      ],
                    )
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
            child: Text(
              AppLocalizations.of(context)!.consultationCallFifth,
              // 'Konsultasi dengan Dokter',
              style: GoogleFonts.poppins(fontSize: 15, fontWeight: bold),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 65),
            child: Text(
              AppLocalizations.of(context)!.consultationCallSixth,
              // 'Mohon diingat bahwa sesi konsultasi dengan dokter bersifat tertutup dan konsultasi anda dengan dokter bersifat pribadi dan hanya bersifat 2 arah, kami mengimbau user untuk berbicara dengan dokter dengan sepenuh hati dan tanpa perlu ditahan. Sehat selalu!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 10, fontWeight: reguler),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   child: Text(
          //     // AppLocalizations.of(context)!.telephoneMethod,
          //     '+62 888 2323 4444',
          //     style: GoogleFonts.poppins(fontSize: 32, fontWeight: bold),
          //   ),
          // ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 65),
            child: Text(
              AppLocalizations.of(context)!.consultationCallSeventh,
              // 'User dipersilahkan untuk menghubungi dokter melalui nomor tersebut, dimohon kepada user untuk berkonsultasi dengan dokter tepat waktu.',
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
