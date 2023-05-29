import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/view_all_doctor/custom_search.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifikasi',
          style: GoogleFonts.inter(
              fontWeight: bold, fontSize: 15, color: blackColor),
        ),
        backgroundColor: whiteColor,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: Iconify(
              Zondicons.search,
              size: 24,
              color: blackColor,
            ),
          ),
        ],
        elevation: 0,
      ),
      drawer: const SideBar(),

      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              height: 90,
                              child: Image.asset(
                                'assets/images/notif_picture.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sesi Konsultasi',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    'Hi, Kak! Jangan lupa sesi konsultasi Psikologi dengan \nPsikolog Yoga mulai pukul 10.00 - 11.00, 23 Mei 2023 \nvia chat. ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: reguler,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Iconify(
                                        Zondicons.time,
                                        size: 12,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text('24-04-28 10:36',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: reguler,
                                          ))
                                    ],
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
    );
  }
}
