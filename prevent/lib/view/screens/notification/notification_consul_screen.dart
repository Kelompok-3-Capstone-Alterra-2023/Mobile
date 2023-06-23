import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/view_all_doctor/custom_search.dart';

class NotificationKonsulScreen extends StatelessWidget {
  const NotificationKonsulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Konsultasi',
          style: GoogleFonts.inter(
              fontWeight: bold, fontSize: 15, color: blackColor),
        ),
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
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
                      // height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: SizedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              // height: 90,
                              child: Image.asset(
                                'assets/images/notif_picture.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
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
                                      'Hi, Kak! Jangan lupa sesi konsultasi Psikologi dengan Psikolog Yoga mulai pukul 10.00 - 11.00, 23 Mei 2023 via chat. ',
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
                                        const Iconify(
                                          Zondicons.time,
                                          size: 12,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '24-04-28 10:36',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: reguler,
                                          ),
                                        ),
                                      ],
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
