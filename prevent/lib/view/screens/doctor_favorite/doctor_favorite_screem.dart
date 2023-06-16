import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/detail_doctor/detail_doctor_screen.dart';
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
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 290,
          crossAxisSpacing: 9,
          mainAxisSpacing: 50,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 13),
              decoration: BoxDecoration(
                color: colorStyleThird,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(children: [
                      const CircleAvatar(
                        radius: 62,
                        backgroundImage:
                            AssetImage('assets/images/doctor_image.png'),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: SizedBox(
                            height: 29,
                            width: 29,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: offlineColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Iconify(
                                  Mdi.telephone_in_talk,
                                  color: whiteColor,
                                ))),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Farid Ahmad S.Psi, M.Psi',
                    overflow: TextOverflow.ellipsis,
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
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      AppLocalizations.of(context)!.doctorFavoriteFourth,
                      // '12 Tahun',
                      style:
                          GoogleFonts.poppins(fontSize: 13, fontWeight: medium),
                    )
                  ]),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FozButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailDoctorScreen(),
                            ));
                      },
                      height: 35,
                      width: 85,
                      buttonColor: colorStyleFifth,
                      child: Text(
                        AppLocalizations.of(context)!.doctorFavoriteFifth,
                        // 'Konsultasi',
                        overflow: TextOverflow.ellipsis,
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
    );
  }
}
