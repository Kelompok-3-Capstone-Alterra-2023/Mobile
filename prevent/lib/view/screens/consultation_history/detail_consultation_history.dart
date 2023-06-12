import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';

class DetailConsultationHistoryScreen extends StatefulWidget {
  const DetailConsultationHistoryScreen({super.key});

  @override
  State<DetailConsultationHistoryScreen> createState() =>
      _DetailConsultationHistoryScreenState();
}

class _DetailConsultationHistoryScreenState
    extends State<DetailConsultationHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          AppLocalizations.of(context)!.detailConsulHistoryFirst,
          // 'Riwayat Konsultasi',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.detailConsulHistorySecond,
                      // 'Detail Konsultasi',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 0,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/doctor_image.png'),
                            radius: 65,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 30,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .detailConsulHistoryThird,
                                      // 'Nama Dokter',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: Text(
                                      ': Farid Ahmad',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 30,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .detailConsulHistoryFourth,
                                      // 'Bidang',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .detailConsulHistoryFifth,
                                      // ': Psikolog',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 30,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .detailConsulHistorySixth,
                                      // 'Metode',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .detailConsulHistorySeventh,
                                      // ': Telepon',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 30,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .detailConsulHistoryEighth,
                                      // 'Durasi',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .detailConsulHistoryNinth,
                                      // ': 1 Jam',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Text(
                      AppLocalizations.of(context)!.detailConsulHistoryTenth,
                      // 'Diagnosa',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 183,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: blackColor),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            AppLocalizations.of(context)!.detailConsulHistoryEleventh,
                            // 'Saudari mengalami bipolar yang mana ditandai perubahan suasana hati akibat ketidak seimbangan zat kimia pada otak yang menyebabkan sulit membantu membawa pesan ke jaringan otak. Berikut resep yang harus dikonsumsi antikonvulsan, antipsikotik dan SSRI',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: reguler),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      AppLocalizations.of(context)!.detailConsulHistoryTwelfth,
                      // 'Detail Pembayaran',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.detailConsulHistoryThirteenth,
                          // 'Biaya Konsultasi',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(300000),
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.detailConsulHistoryFourteenth,
                          // 'Biaya Obat',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(500000),
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 1,
                      color: blackColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.detailConsulHistoryFifteenth,
                          // 'Total',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(800000),
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorStyleFifth,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.detailConsulHistorySixteenth,
                    // 'Unduh Bukti',
                    style: GoogleFonts.poppins(fontWeight: bold, fontSize: 16),
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
