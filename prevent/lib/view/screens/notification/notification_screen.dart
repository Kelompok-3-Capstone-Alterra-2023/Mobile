import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:prevent/util/common.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/notification/notification_consul_screen.dart';
import 'package:prevent/view/screens/notification/notification_payment_screen.dart';
import 'package:prevent/view/screens/view_all_doctor/custom_search.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: const EdgeInsets.only(left: 10),
              icon: const Iconify(
                Ph.list,
                size: 36,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.notificationFirst,
          // 'Notifikasi',
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: Iconify(
              Ri.search_line,
              color: blackColor,
            ),
          )
        ],
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
                  Expanded(
                    child: Padding(
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
                            'Hi, Kak! Jadwal konsultasi dimulai pada 22 Juni 2023 ...',
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: reguler),
                          )
                        ],
                      ),
                    ),
                  ),
                  // const Spacer(),
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
                  Expanded(
                    child: Padding(
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
                  ),
                  // const Spacer(),
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
