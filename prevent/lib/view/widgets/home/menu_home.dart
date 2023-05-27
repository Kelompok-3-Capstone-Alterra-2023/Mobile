import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:prevent/view/screens/article/view_all_article_screen.dart';
import 'package:prevent/view/screens/consultation/consultation_screen.dart';
import 'package:prevent/view/screens/view_all_doctor/custom_search.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';

import '../../../util/theme.dart';

class MenuHome extends StatelessWidget {
  const MenuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: Image.asset('assets/images/logo_app.png'),
        centerTitle: true,
        backgroundColor: colorStyleFifth,
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/homepage_one.png',
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Kesehatan Mental Prioritas Global',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: bold,
                                fontSize: 12.5,
                                color: successThird),
                          ),
                          Text(
                            'Prevent! merupakan salah satu platform konsultasi psikolog terbaik yang bisa bantu hadapi permsalahanmu!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: reguler,
                                fontSize: 10,
                                color: blackColor),
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  minimumSize: const Size(170, 40),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  backgroundColor: colorStyleFifth),
                              onPressed: () {
                                // TODO: Memilih Konsultasi
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ConsultationScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Konsultasi',
                                style: GoogleFonts.poppins(
                                    fontWeight: bold,
                                    fontSize: 15,
                                    color: whiteColor),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Artikel Terbaru',
                    style: GoogleFonts.poppins(fontSize: 13, fontWeight: bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ViewAllArticleScreen()));
                    },
                    child: Text(
                      'Lihat Semua',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: bold, color: blackColor),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // TODO: Fitur Sorting
              child: Wrap(
                spacing: 8,
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50, 25),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: colorStyleFifth),
                      onPressed: () {},
                      child: Text(
                        'Semua',
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: whiteColor),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: const Size(50, 25),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        side: BorderSide(color: colorStyleFifth),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Kesehatan Mental',
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: colorStyleFifth),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: const Size(50, 25),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        side: BorderSide(color: colorStyleFifth),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Stress',
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: colorStyleFifth),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: const Size(50, 25),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        side: BorderSide(color: colorStyleFifth),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Depresi',
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: colorStyleFifth),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: const Size(50, 25),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        side: BorderSide(color: colorStyleFifth),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Ganguan Kepribadian',
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: colorStyleFifth),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: InkWell(
                      onTap: () {
                        // TODO: Detail Artikel
                      },
                      child: SingleChildScrollView(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/dummy_artikel.png'),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ini Cara Menyembuhkan Trauma pada Anak yang Menjadi Korban Buliyying!',
                                        style: GoogleFonts.poppins(
                                            fontSize: 10, fontWeight: medium),
                                      ),
                                      const SizedBox(
                                        height: 11,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: colorStyleThird
                                                .withOpacity(0.40),
                                            border: Border.all(
                                                color: colorStyleThird),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3))),
                                        child: Text(
                                          'Kesehatan Mental',
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: medium,
                                              color: colorStyleFifth),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
