import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons
// import 'package:colorful_iconify_flutter/icons/emojione.dart'; // for Colorful Icons
import 'package:prevent/util/theme.dart';

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
        // leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: Iconify(
              Zondicons.search,
              size: 24,
              color: whiteColor,
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: colorStyleFifth,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 80,
                width: double.infinity,
                color: Colors.blue,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: const [
                    Text('Name'),
                    Text('Gmail'),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite_outline,
                  color: Color(0XFF2F5146),
                ),
                title: Text(
                  'Dokter Favorite',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: reguler,
                    color: colorStyleEighth,
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/konsultasiberjalan_icon.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Konsultasi Berjalan'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  color: Color(0XFF2F5146),
                ),
                title: Text('Pengaturan'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: Color(0XFF2F5146),
                ),
                title: Text('Pusat Bantuan'),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Dokter Tersedia',
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
                      height: 190,
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
                                        'Tersedia',
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
                            Padding(
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
                                    'Psikolog Klinis',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Trauma, Stress, Depresi',
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
                                          '4 Tahun',
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
