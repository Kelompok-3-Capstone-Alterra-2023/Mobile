import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' as pwlib;
import 'package:path_provider/path_provider.dart';

import '../../../models/consultation_history_model.dart';
import '../../../util/common.dart';
import '../../../util/theme.dart';

class DetailConsultationHistoryScreen extends StatefulWidget {
  const DetailConsultationHistoryScreen({super.key, required this.history});
  final ConsultationHistory history;

  @override
  State<DetailConsultationHistoryScreen> createState() =>
      _DetailConsultationHistoryScreenState();
}

class _DetailConsultationHistoryScreenState
    extends State<DetailConsultationHistoryScreen> {
  String? pdfPath;
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
                                      ': ${widget.history.doctorName}',
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
                                      ': ${widget.history.specialist}',
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
                                      ': ${widget.history.method}',
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
                                      ': ${widget.history.duration} Hour',
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
                            AppLocalizations.of(context)!
                                .detailConsulHistoryEleventh,
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
                          AppLocalizations.of(context)!
                              .detailConsulHistoryThirteenth,
                          // 'Biaya Konsultasi',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(widget.history.consultationFee),
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
                          AppLocalizations.of(context)!
                              .detailConsulHistoryFourteenth,
                          // 'Biaya Obat',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(widget.history.drugCost),
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
                          AppLocalizations.of(context)!
                              .detailConsulHistoryFifteenth,
                          // 'Total',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR').format(
                              widget.history.consultationFee +
                                  widget.history.drugCost),
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
                  onPressed: () {
                    exportToPdf(context);
                  },
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

  Future<void> exportToPdf(BuildContext context) async {
    final pdf = pw.Document();
    final titleStyle = pw.TextStyle(
      fontSize: 16,
      fontWeight: pw.FontWeight.bold,
    );

    final subtitleStyle = pw.TextStyle(
      fontSize: 14,
      fontWeight: pw.FontWeight.bold,
    );

    final textBoldStyle = pw.TextStyle(
      fontSize: 12,
      fontWeight: pw.FontWeight.bold,
    );

    final textStyle = pw.TextStyle(
      fontSize: 12,
      fontWeight: pw.FontWeight.normal,
    );

    // final iconPreventRectangle = pw.MemoryImage(
    //   File('assets/images/icon_prevent_rectangle.png').readAsBytesSync(),
    // );

    pdf.addPage(pwlib.Page(
      build: (pwlib.Context context) => pwlib.Column(
          crossAxisAlignment: pwlib.CrossAxisAlignment.end,
          children: [
            pwlib.Column(
              crossAxisAlignment: pwlib.CrossAxisAlignment.start,
              children: [
                pwlib.Row(
                  mainAxisAlignment: pwlib.MainAxisAlignment.center,
                  children: [
                    // pwlib.Image(iconPreventRectangle),
                    pwlib.SizedBox(
                      width: 11,
                    ),
                    pwlib.Text(
                      'Lembar Hasil Konsultasi',
                      style: titleStyle,
                    ),
                  ],
                ),
                pwlib.SizedBox(
                  height: 40,
                ),
                pwlib.Text(
                  'Detail Pasien',
                  style: subtitleStyle,
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Nama Pasien',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': Ananda Putri Lestari',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Jenis Kelamin',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': Perempuan',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Tanggal Lahir',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': 10 Juli 1998',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.SizedBox(
                  height: 20,
                ),
                pwlib.Text(
                  'Detail Pemeriksaan',
                  style: subtitleStyle,
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Nama Dokter',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': Farid Ahmad',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Bidang',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': Psikolog',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Metode',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': Telepon',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Durasi',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': 1 Jam',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.Row(
                  crossAxisAlignment: pwlib.CrossAxisAlignment.start,
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Diagnosa Dokter',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': Saudari mengalami bipolar yang  mana ditandai perubahan suasana hati akibat ketidak seimbangan zat kimia pada otak yang menyebabkan sulit membantu membawa pesan ke jaringan otak. Berikut resep yang harus dikonsumsi antikonvulsan, antipsikotik dan SSRI',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.Row(
                  crossAxisAlignment: pwlib.CrossAxisAlignment.start,
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Resep Obat',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Column(
                        crossAxisAlignment: pwlib.CrossAxisAlignment.start,
                        children: [
                          pwlib.Text(
                            ': Cefadroxil 1x500Mg',
                            style: textBoldStyle,
                          ),
                          pwlib.Text(
                            '2x1 konsumsi sehabis makan',
                            style: textStyle,
                          ),
                          pwlib.Text(
                            'Cefadroxil 1x500Mg',
                            style: textBoldStyle,
                          ),
                          pwlib.Text(
                            '2x1 konsumsi sehabis makan',
                            style: textStyle,
                          ),
                          pwlib.Text(
                            'Cefadroxil 1x500Mg',
                            style: textBoldStyle,
                          ),
                          pwlib.Text(
                            '2x1 konsumsi sehabis makan',
                            style: textStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                pwlib.SizedBox(
                  height: 18,
                ),
                pwlib.Text(
                  'Detail Pembayaran',
                  style: subtitleStyle,
                ),
                pwlib.Row(
                  children: [
                    pwlib.Expanded(
                      flex: 2,
                      child: pwlib.Text(
                        'Biaya Konsultasi',
                        style: textStyle,
                      ),
                    ),
                    pwlib.Expanded(
                      flex: 3,
                      child: pwlib.Text(
                        ': Rp. 800.000',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
                pwlib.SizedBox(
                  height: 30,
                ),
              ],
            ),
            pwlib.Column(
              crossAxisAlignment: pwlib.CrossAxisAlignment.center,
              children: [
                pwlib.Text(
                  'Salam Sehat',
                  style: subtitleStyle,
                ),
                pwlib.SizedBox(
                  height: 13,
                ),
                // pwlib.Image(pw.MemoryImage(
                //     File('assets/images/logo_prevent.png').readAsBytesSync())),
              ],
            )
          ]),
    ));
    final output = await getExternalStorageDirectory();
    final file = File('${output?.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF berhasil diexport! Lokasi: ${file.path}'),
      ),
    );
  }
}
