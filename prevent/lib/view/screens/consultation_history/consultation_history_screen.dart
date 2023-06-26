import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/consultation_history/detail_consultation_history.dart';
import 'package:prevent/view/widgets/home/sign_in_alert.dart';
import 'package:prevent/view_models/consultation_history_view_model.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';

class ConsultationHistoryScreen extends StatefulWidget {
  const ConsultationHistoryScreen({super.key});

  @override
  State<ConsultationHistoryScreen> createState() =>
      _ConsultationHistoryScreenState();
}

class _ConsultationHistoryScreenState extends State<ConsultationHistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ConsultationViewModel>().getConsulHistory();
    context.read<ConsultationViewModel>().getConsulRunning();
  }

  @override
  Widget build(BuildContext context) {
    if (!context.read<LoginViewModel>().isLogin) {
      return const Center(
        child: AlertLogin(),
      );
    }
    return DefaultTabController(
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
                        fontSize: 12, fontWeight: semiBold, color: colorNavBar),
                  ),
                ),
                Tab(
                    child: Text(
                  AppLocalizations.of(context)!.consultationHistory,
                  // 'Riwayat Konsultasi',
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: semiBold, color: colorNavBar),
                )),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Consumer<ConsultationViewModel>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.running.length,
                        itemBuilder: (context, index) {
                          final doctor = value.running[index];
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return DetailConsultationHistoryScreen(
                                        history: value.history[index],
                                      );
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
                                      doctor.doctorName,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: medium),
                                    ),
                                    Text(
                                      'Method ${doctor.method}',
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
                                  Text(doctor.dateTime,
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
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Consumer<ConsultationViewModel>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.history.length,
                        itemBuilder: (context, index) {
                          final doctor = value.history[index];
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return DetailConsultationHistoryScreen(
                                        history: value.history[index],
                                      );
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
                                      doctor.doctorName,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, fontWeight: medium),
                                    ),
                                    Text(
                                      'Method ${doctor.method}',
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
                                  Text(doctor.dateTime,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
