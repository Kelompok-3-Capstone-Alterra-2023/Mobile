import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/consultation_history/detail_consultation_history.dart';

import '../../../util/common.dart';
import '../view_all_doctor/custom_search.dart';

class ConsultationHistoryScreen extends StatefulWidget {
  const ConsultationHistoryScreen({super.key});

  @override
  State<ConsultationHistoryScreen> createState() =>
      _ConsultationHistoryScreenState();
}

class _ConsultationHistoryScreenState extends State<ConsultationHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.consultationHistory,
          // 'Riwayat Konsultasi',
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: Iconify(
              Ri.search_line,
              color: blackColor,
            ),
          )
        ],
      ),
      backgroundColor: whiteColor,
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints.expand(height: 50.0),
                child: TabBar(
                  indicatorColor: colorNavBar,
                  tabs: [
                    Tab(
                        child: Text(
                      AppLocalizations.of(context)!.sliderRunningHistory,
                      // 'Riwayat Berjalan',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: semiBold,
                          color: colorNavBar),
                    )),
                    Tab(
                        child: Text(
                      AppLocalizations.of(context)!.consultationHistory,
                      // 'Riwayat Konsultasi',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: semiBold,
                          color: colorNavBar),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const DetailConsultationHistoryScreen();
                                    },
                                  ));
                                },
                                leading: const CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      'assets/images/doctor_image.png'),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Psikolog Farid Ahmad',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: medium),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .telephoneMethod,
                                      // 'Metode Telepon',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: reguler),
                                    ),
                                  ],
                                ),
                                subtitle: Row(children: [
                                  const Iconify(
                                    Mdi.clock_time_four_outline,
                                    size: 13,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text('24-04-2023 10:00 - 11.00',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: reguler,
                                          color: blackColor))
                                ]),
                              ),
                              Divider(
                                thickness: 1,
                                color: greyColor,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const DetailConsultationHistoryScreen();
                                    },
                                  ));
                                },
                                leading: const CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      'assets/images/doctor_image.png'),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Psikolog Farid Ahmad',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: medium),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .telephoneMethod,
                                      // 'Metode Telepon',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: reguler),
                                    ),
                                  ],
                                ),
                                subtitle: Row(children: [
                                  const Iconify(
                                    Mdi.clock_time_four_outline,
                                    size: 13,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text('24-04-2023 10:00 - 11.00',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: reguler,
                                          color: blackColor))
                                ]),
                              ),
                              Divider(
                                thickness: 1,
                                color: greyColor,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
