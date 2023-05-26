import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/article/search_article_screen.dart';

class ViewAllArticleScreen extends StatefulWidget {
  const ViewAllArticleScreen({super.key});

  @override
  State<ViewAllArticleScreen> createState() => _ViewAllArticleScreenState();
}

class _ViewAllArticleScreenState extends State<ViewAllArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          'Artikel',
          style: TextStyle(color: blackColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchArticleScreen(),
                ),
              );
            },
            icon: Iconify(
              Eva.search_outline,
              color: blackColor,
              size: 45,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.01),
          child: Container(
            color: blackColor.withOpacity(0.3),
            height: 1,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Ganguan Kepribadian',
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: colorStyleFifth),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: Container(
                      height: 100,
                      width: 412,
                      color: whiteColor,
                      child: Row(
                        children: [
                          Image.asset('assets/images/stress.png'),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 14),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: colorStyleThird,
                                    border: Border.all(color: colorStyleFifth),
                                  ),
                                  child: const FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Stres',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 14),
                                const Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 32),
                                    child: Text(
                                      'Ini 9 Tanda Holiday Blues Setelah Libur Lebaran Selesai',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 3);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
