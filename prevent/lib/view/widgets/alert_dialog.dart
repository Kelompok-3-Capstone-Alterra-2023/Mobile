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
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: colorStyleEighth,
            child: Text(
              'Resep obat dan aturan dosis pemakaian',
              style: GoogleFonts.poppins(
                  fontWeight: bold, fontSize: 12, color: blackColor),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset('assets/images/Cefadoxil.png'),
                        ),
                        Column(
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
    );
  }
}
