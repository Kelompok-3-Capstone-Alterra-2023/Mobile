import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:intl/intl.dart';
// import 'package:colorful_iconify_flutter/icons/emojione.dart'; // for Colorful Icons
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/detail_doctor/detail_doctor_screen.dart';
import 'package:provider/provider.dart';
import '../../../util/common.dart';
import '../../../view_models/doctor_view_model.dart';
import 'custom_search.dart';

class ViewAllDoctorScreen extends StatefulWidget {
  const ViewAllDoctorScreen({super.key});

  @override
  State<ViewAllDoctorScreen> createState() => _ViewAllDoctorScreenState();
}

class _ViewAllDoctorScreenState extends State<ViewAllDoctorScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorViewModel>().fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo_appbar_prevent.png',
          width: 100,
          height: 100,
        ),
        backgroundColor: colorStyleFifth,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: Iconify(
              Ri.search_line,
              size: 24,
              color: whiteColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                AppLocalizations.of(context)!.consultationFourth,
                // 'Dokter Tersedia',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Consumer<DoctorViewModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = value.doctors[index];
                      return InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DetailDoctorScreen(
                              doctor: doctor,
                            );
                          },
                        )),
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Row(
                              children: [
                                // Kiri
                                Column(
                                  children: [
                                    SizedBox(
                                        width: 125,
                                        height: 140,
                                        child: doctor.propic.isEmpty
                                            ? Image.asset(
                                                'assets/images/doctor1.png',
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                doctor.propic,
                                                height: 150,
                                                fit: BoxFit.fill,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              )),
                                    Container(
                                      width: 125,
                                      height: 42,
                                      color: greyColorSecond,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: offlineColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Iconify(
                                                    Ph.chat_circle_dots_bold,
                                                    color: whiteColor,
                                                  ))),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .consultationSixth,
                                            // 'Tersedia',
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: semiBold),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: doctor.statusOnline
                                                ? onlineColor
                                                : offlineColor,
                                            radius: 7,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // Kanan
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          doctor.fullName,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          doctor.specialist,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: medium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          doctor.description,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: medium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: greyColorSecond,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.work,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '${doctor.workExperience} years',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 10,
                                                    fontWeight: semiBold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          NumberFormat.simpleCurrency(
                                                  name: 'IDR')
                                              .format(doctor.price),
                                          style: GoogleFonts.poppins(
                                              fontSize: 14, fontWeight: bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
