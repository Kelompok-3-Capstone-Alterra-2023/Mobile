import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/simple_line_icons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';
import 'package:provider/provider.dart';
import '../../../view_models/home_view_model.dart';
import '../../widgets/home/bottom_nav.dart';
import 'package:prevent/view/screens/consultation/consultation_screen.dart';
import 'package:prevent/view/widgets/sidebar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context, listen: true);

    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: provider.scaffoldKey,
      appBar: AppBar(
        backgroundColor: colorStyleFifth,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            provider.scaffoldKey.currentState!.openDrawer();
          },
          icon: Iconify(
            SimpleLineIcons.menu,
            color: whiteColor,
            size: 30,
          ),
        ),
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
          ),
        ],
      ),
      body: provider.boddy(),
      drawer: const SideBar(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
