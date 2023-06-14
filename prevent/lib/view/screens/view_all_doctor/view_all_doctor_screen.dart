import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
// import 'package:colorful_iconify_flutter/icons/emojione.dart'; // for Colorful Icons
import 'package:prevent/util/theme.dart';
import '../../../util/common.dart';
import '../../widgets/home/side_bar.dart';
import 'custom_search.dart';

class ViewAllDoctorScreen extends StatelessWidget {
  const ViewAllDoctorScreen({super.key});

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
      drawer: const SideBar(),
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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
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
                                  child: Image.asset(
                                    'assets/images/doctor_image.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 125,
                                  height: 42,
                                  color: greyColorSecond,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Image.asset(
                                        'assets/images/ph_chat-circle-dots.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .consultationSixth,
                                        // 'Tersedia',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12, fontWeight: semiBold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                        'assets/images/dots_green.png',
                                        width: 12,
                                        height: 12,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Fauzan Hakim M.Psi, Psikolog',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .consultationSeventh,
                                      // 'Psikolog Klinis',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .consultationEighth,
                                      // 'Trauma, Stress, Depresi',
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
                                        borderRadius: BorderRadius.circular(50),
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
                                            AppLocalizations.of(context)!
                                                .consultationNinth,
                                            // '4 Tahun',
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
                                      'RP. 200.000',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
