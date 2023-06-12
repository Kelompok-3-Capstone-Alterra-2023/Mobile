import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/notification/notificationConsul_screen.dart';
import 'package:prevent/view/screens/view_all_doctor/custom_search.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';

import 'notificationPayment_screen.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NotificationKonsulScreen())),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Konsultasi_notif.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Konsultasi Psikolog',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          'kak! Jadwal konsultasi dimulai pada 17 Juni ...',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: reguler),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const NotificationKonsulScreen()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
            color: greyColor,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NotificationPaymentScreen())),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/Pembayaran_notif.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pembayaran',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          'Pembayaran untuk transaksi ATWY1289 dengan ...',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: reguler),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const NotificationPaymentScreen()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}
