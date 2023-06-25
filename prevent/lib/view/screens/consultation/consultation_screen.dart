import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:intl/intl.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/consultation/view_all_call_doctor_screen.dart';
import 'package:prevent/view/screens/consultation/view_all_chat_doctor_screen.dart';
import 'package:prevent/view/screens/detail_doctor/detail_doctor_screen.dart';
import 'package:prevent/view/screens/view_all_doctor/view_all_doctor_screen.dart';
import 'package:prevent/view/widgets/home/sign_in_alert.dart';
import 'package:prevent/view_models/doctor_view_model.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../util/common.dart';
import '../view_all_doctor/custom_search.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorViewModel>().fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo_app.png'),
        centerTitle: true,
        backgroundColor: colorStyleFifth,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        actions: [
          if (context.read<LoginViewModel>().isLogin)
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: Iconify(
                Zondicons.search,
                size: 24,
                color: whiteColor,
              ),
            ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (!context.read<LoginViewModel>().isLogin) {
            return const AlertLogin();
          }
          return Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: ListView(
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  AppLocalizations.of(context)!.consultationFirst,
                  // 'Pilih Cara Komunikasimu!',
                  style:
                      GoogleFonts.poppins(fontSize: 15, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonConsultation(
                  text: AppLocalizations.of(context)!.consultationSecond,
                  // text: 'Konseling Via Chat',
                  iconData: Ph.chat_circle_dots_bold,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ViewAllChatDoctorScreen()));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonConsultation(
                  // text: 'Konseling Via Panggilan',
                  text: AppLocalizations.of(context)!.consultationThird,
                  iconData: Mdi.telephone_in_talk,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ViewAllCallDoctorScreen()));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.consultationFourth,
                        // 'Dokter Tersedia',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: semiBold),
                      ),
                      TextButton(
                        child: Text(
                          AppLocalizations.of(context)!.consultationFifth,
                          // 'Lihat Semua',
                          style: GoogleFonts.poppins(
                              color: blackColor,
                              fontSize: 10,
                              fontWeight: bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ViewAllDoctorScreen()));
                        },
                      ),
                    ],
                  ),
                ),
                Consumer<DoctorViewModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // padding: EdgeInsets.all(4),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Jumlah kolom dalam GridView
                        childAspectRatio:
                            0.64, // Perbandingan aspek antara lebar dan tinggi item
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 8,
                      ),
                      itemCount:
                          value.doctors.length < 6 ? value.doctors.length : 6,
                      itemBuilder: (BuildContext context, int index) {
                        final doctor = value.doctors[index];
                        if (value.doctors.isEmpty) {
                          return CircularProgressIndicator(
                            color: colorStyleFifth,
                          );
                        } else {
                          return InkWell(
                            onTap: () =>
                                Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailDoctorScreen(
                                  doctor: doctor,
                                );
                              },
                            )),
                            child: GridTile(
                              child: Card(
                                shadowColor: greyColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        child: doctor.propic.isEmpty
                                            ? Image.asset(
                                                'assets/images/doctor1.png',
                                                fit: BoxFit.contain,
                                              )
                                            : Image.network(
                                                doctor.propic,
                                                height: 130,
                                                fit: BoxFit.fill,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              )),
                                    SizedBox(
                                      height: 28,
                                      child: Container(
                                        color: const Color(0xffd8d8d8),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                    height: 29,
                                                    width: 29,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: offlineColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Iconify(
                                                          Ph.chat_circle_dots_bold,
                                                          color: whiteColor,
                                                        ))),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .consultationSixth,
                                                  // 'Tersedia',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight: semiBold),
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      doctor.statusOnline
                                                          ? onlineColor
                                                          : offlineColor,
                                                  radius: 7,
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            doctor.fullName,
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: semiBold),
                                          ),
                                          Text(
                                            doctor.specialist,
                                            style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                fontWeight: reguler),
                                          ),
                                          Text(
                                            doctor.description,
                                            style: GoogleFonts.poppins(
                                                fontSize: 8,
                                                fontWeight: reguler),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          SizedBox(
                                            height: 14,
                                            width: 59,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffd8d8d8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.work,
                                                      size: 10,
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      '${doctor.workExperience} years',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  reguler),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            NumberFormat.simpleCurrency(
                                                    name: 'IDR')
                                                .format(doctor.price),
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: semiBold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ButtonConsultation extends StatelessWidget {
  final String text;
  final String iconData;
  final Function() onPressed;
  const ButtonConsultation(
      {super.key,
      required this.text,
      required this.iconData,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 66,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(color: blackColor)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: colorStyleFifth,
                  radius: 25,
                  child: Iconify(
                    iconData,
                    color: whiteColor,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.poppins(
                          fontWeight: semiBold,
                          fontSize: 10,
                          color: blackColor),
                    ),
                    Text(
                      AppLocalizations.of(context)!.consultationTenth,
                      // 'Lihat Semua',
                      style: GoogleFonts.poppins(
                          fontWeight: reguler, fontSize: 8, color: blackColor),
                    )
                  ],
                ),
              ],
            ),
            const Iconify(
              Ic.chevron_right,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
