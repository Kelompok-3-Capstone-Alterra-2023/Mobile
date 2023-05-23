import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/simple_line_icons.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/consultation/consultation_screen.dart';
import 'package:prevent/view/screens/article/view_all_article_screen.dart';
import 'package:prevent/view/widgets/sidebar_widget.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';
import 'package:provider/provider.dart';
import '../../../view_models/home_view_model.dart';
import '../../widgets/home/bottom_nav.dart';
import '../view_all_doctor/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context, listen: true);
    return Scaffold(
      key: provider.scaffoldKey,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ViewAllArticleScreen()));
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
        ],
      ),
      body: provider.boddy(),
      drawer: const SideBar(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
