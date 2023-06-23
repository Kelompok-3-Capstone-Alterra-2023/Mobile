import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/notification/notification_consul_screen.dart';
import 'package:prevent/view/screens/notification/notification_payment_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          'kak! Jadwal konsultasi dimulai pada 17 Juni ...',
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
    );
  }
}
