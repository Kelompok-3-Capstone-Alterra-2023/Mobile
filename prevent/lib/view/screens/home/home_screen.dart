import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/simple_line_icons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/consultation/consultation_screen.dart';
import 'package:prevent/view/widgets/sidebar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    int pageIndex = 0;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: colorStyleFifth,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Iconify(
              SimpleLineIcons.menu,
              color: whiteColor,
              size: 30,
            )),
        title: Image.asset(
          'assets/images/text_logo.png',
          width: 128,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // TODO: Fitur Search
              },
              icon: Iconify(
                Eva.search_outline,
                color: whiteColor,
                size: 45,
              ))
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ConsultationScreen()));
                                // TODO: Memilih Konsultasi
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
                  InkWell(
                    onTap: () {
                      // TODO: Navigasi ke semua artikel
                    },
                    child: Text(
                      'Lihat Semua',
                      style:
                          GoogleFonts.poppins(fontSize: 10, fontWeight: bold),
                    ),
                  )
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
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 235,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/dummy_artikel.png'),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color:
                                              colorStyleThird.withOpacity(0.40),
                                          border: Border.all(
                                              color: colorStyleThird),
                                          borderRadius: const BorderRadius.all(
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
                  );
                },
              ),
            )
          ],
        ),
      ),
      drawer: const SideBar(),
      // bottomNavigationBar: Container(
      //   height: 74,
      //   decoration: BoxDecoration(
      //     border: Border(
      //       top: BorderSide(
      //         color: colorNavBar,
      //         width: 1.0,
      //       ),
      //     ),
      //   ),
      //   child: BottomNavigationBar(
      //     selectedFontSize: 10,
      //     unselectedFontSize: 10,
      //     showSelectedLabels: true,
      //     showUnselectedLabels: true,
      //     selectedItemColor: colorNavBar,
      //     unselectedItemColor: colorUnselectedNavBar,
      //     selectedLabelStyle: GoogleFonts.inter(
      //         fontSize: 10, fontWeight: reguler, color: colorNavBar),
      //     unselectedLabelStyle: GoogleFonts.inter(
      //         fontSize: 10, fontWeight: reguler, color: colorUnselectedNavBar),
      //     elevation: 0,
      //     backgroundColor: whiteColor,
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/icons/home.svg',
      //           color: pageIndex == 0 ? colorNavBar : colorUnselectedNavBar,
      //         ),
      //         label: 'Beranda',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/icons/riwayat_konsul.svg',
      //           color: pageIndex == 2 ? colorNavBar : colorUnselectedNavBar,
      //         ),
      //         label: 'Riwayat Konsultasi',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/icons/notif.svg',
      //           color: pageIndex == 1 ? colorNavBar : colorUnselectedNavBar,
      //         ),
      //         label: 'Notifikasi',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: SvgPicture.asset(
      //           'assets/icons/profil.svg',
      //           color: pageIndex == 3 ? colorNavBar : colorUnselectedNavBar,
      //         ),
      //         label: 'Profil',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
