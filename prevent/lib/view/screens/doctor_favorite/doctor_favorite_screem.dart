import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/widgets/foz_button.dart';

import '../../../util/common.dart';

class DoctorFavoriteScreen extends StatelessWidget {
  const DoctorFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leadingWidth: 30,
        backgroundColor: whiteColor,
        leading: IconButton(
            splashRadius: 18,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: blackColor,
            )),
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.doctorFavoriteFirst,
          // 'Doctor Favorite',
          style: GoogleFonts.inter(
              color: blackColor, fontWeight: semiBold, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisExtent: 285,
            childAspectRatio: 0.62,
            crossAxisSpacing: 9,
            mainAxisSpacing: 50,
          ),
          itemBuilder: (context, index) {
            return GridTile(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 13),
                decoration: BoxDecoration(
                  color: colorStyleThird,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 62,
                        backgroundImage:
                            AssetImage('assets/images/doctor_image.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Farid Ahmad S.Psi, M.Psi',
                      style: GoogleFonts.inter(
                        fontWeight: semiBold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.doctorFavoriteSecond,
                      // 'Psikologi Klinis Dewasa',
                      style: GoogleFonts.inter(
                        fontWeight: reguler,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.doctorFavoriteThird,
                      // 'Gangguan kecemasan',
                      style: GoogleFonts.inter(
                        fontWeight: reguler,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(
                        Icons.work,
                        size: 11,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        AppLocalizations.of(context)!.doctorFavoriteFourth,
                        // '12 Tahun',
                        style: GoogleFonts.poppins(
                            fontSize: 11, fontWeight: medium),
                      )
                    ]),
                    const SizedBox(
                      height: 2,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FozButton(
                        onPressed: () {
                          // TODO: Navigasi konsultasi
                        },
                        height: 35,
                        width: 100,
                        buttonColor: colorStyleFifth,
                        child: Text(
                          AppLocalizations.of(context)!.doctorFavoriteFifth,
                          // 'Konsultasi',
                          style: GoogleFonts.inter(
                              fontWeight: semiBold,
                              fontSize: 12,
                              color: whiteColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
