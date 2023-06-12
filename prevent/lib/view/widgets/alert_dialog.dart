import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';

class ResepAlert extends StatefulWidget {
  ResepAlert({Key? key}) : super(key: key);

  @override
  State<ResepAlert> createState() => _ResepAlertState();
}

class _ResepAlertState extends State<ResepAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 400,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Resep obat dan aturan dosis pemakaian',
                style: GoogleFonts.poppins(
                    fontWeight: bold, fontSize: 12, color: blackColor),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          SizedBox(
                            child: Image.asset('assets/images/Cefadoxil.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cefadoxil 1x 500 Mg',
                                style: TextStyle(
                                    fontWeight: bold,
                                    fontSize: 12,
                                    color: blackColor),
                              ),
                              Text(
                                '2x1 konsumsi sehabis makan',
                                style: TextStyle(
                                    fontWeight: reguler,
                                    fontSize: 12,
                                    color: blackColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogCloseSession extends StatelessWidget {
  const DialogCloseSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 400,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Permintaan tutup sesi oleh dokter',
                style: GoogleFonts.poppins(
                    fontWeight: bold, fontSize: 12, color: blackColor),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50),
              child: Text(
                'Sesi akan ditutup oleh Dokter, kamu dapat mengakses kembali riwayat chat dengan Dokter melalui halaman riwayat konsultasi. Kamu juga dapat melihat diagnosa akhir serta resep obat yang dianjurkan oleh Dokter melalui halaman riwayat konsultasi.',
                style: GoogleFonts.poppins(
                    fontWeight: reguler, fontSize: 15, color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 30,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorStyleEighth,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onPressed: () {},
                  child: Text(
                    'Tutup Sesi Konsultasi',
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: reguler, color: whiteColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
