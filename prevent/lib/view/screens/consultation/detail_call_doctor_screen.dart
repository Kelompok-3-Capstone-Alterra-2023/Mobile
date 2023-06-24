import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:intl/intl.dart';
import 'package:prevent/util/theme.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:prevent/view/screens/payment/payment_screen.dart';
import 'package:prevent/view/widgets/foz_button.dart';

import '../../../util/common.dart';

class DetailCallDoctorScreen extends StatelessWidget {
  const DetailCallDoctorScreen({
    super.key,
    required this.id,
    required this.fullname,
    required this.specialist,
    required this.description,
    required this.price,
    required this.alumnus,
    required this.alumnus2,
    required this.practiceAddress,
    required this.strNumber,
    required this.statusOnline,
    required this.workExperience,
    required this.propic,
  });
  final int id;
  final String fullname;
  final String specialist;
  final String description;
  final int price;
  final String alumnus;
  final String alumnus2;
  final String practiceAddress;
  final String strNumber;
  final bool statusOnline;
  final int workExperience;
  final String propic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 46,
        backgroundColor: whiteColor,
        shape: Border(bottom: BorderSide(color: blackColor, width: 0.5)),
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: blackColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 33),
          child: Column(
            children: [
              Container(
                height: 243,
                width: 400,
                color: Colors.grey,
                child: Stack(
                  children: [
                    SizedBox.expand(
                        child: propic.isEmpty
                            ? Image.asset(
                                'assets/images/doctor1.png',
                                fit: BoxFit.cover,
                              )
                            : Image.network(propic)),
                    Positioned(
                      right: 0,
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: offlineColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Iconify(
                            Mdi.telephone_in_talk,
                            color: whiteColor,
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: 23,
                        width: 84,
                        decoration: BoxDecoration(
                            color: colorUnselectedNavBar,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 7, right: 4),
                              child: CircleAvatar(
                                backgroundColor:
                                    statusOnline ? onlineColor : offlineColor,
                                radius: 7,
                              ),
                            ),
                            Text(
                              statusOnline ? 'Online' : 'Offline',
                              // 'online',
                              style: GoogleFonts.poppins(
                                  color: whiteColor,
                                  fontSize: 15,
                                  fontWeight: medium),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 35, bottom: 47),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            fullname,
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: semiBold),
                          ),
                        ),
                        IconButton(
                            splashRadius: 15,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_outline,
                              size: 28,
                            ))
                      ],
                    ),
                    Text(
                      specialist,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: reguler),
                    ),
                    Text(
                      description,
                      style:
                          GoogleFonts.poppins(fontSize: 9, fontWeight: reguler),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xffd8d8d8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.work,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '$workExperience years',
                            style: GoogleFonts.poppins(
                                fontSize: 8, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'IDR').format(price),
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 35),
                      child: Row(
                        children: [
                          const Iconify(
                            Mdi.graduation_cap,
                            size: 29,
                          ),
                          const SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .callDetailDoctorFifth,
                                // 'Alumnus',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                alumnus2,
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: reguler,
                                ),
                              ),
                              Text(
                                alumnus,
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: reguler,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25.5),
                      child: Row(
                        children: [
                          const Iconify(
                            Ic.round_maps_home_work,
                            size: 29,
                          ),
                          const SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .callDetailDoctorEighth,
                                // 'Praktik di',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                practiceAddress,
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: reguler,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Image.asset('assets/images/garuda_pancasila.png'),
                          const SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'No. STR',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                strNumber,
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: reguler,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FozButton(
                onPressed: () => showModalBottomSheet(
                  useSafeArea: true,
                  backgroundColor: whiteColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 28),
                      height: 220,
                      child: Column(children: [
                        Text(
                          AppLocalizations.of(context)!.callDetailDoctorTenth,
                          // 'Kapan Kamu Ingin Konsultasi?',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: semiBold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 25, right: 15, left: 19, bottom: 6),
                          child: Row(
                            children: [
                              Iconify(
                                MaterialSymbols.phone_iphone_outline,
                                color: colorStyleFifth,
                                size: 29,
                              ),
                              const SizedBox(width: 17),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => PaymentScreen(
                                              id: id,
                                              fullName: fullname,
                                              specialist: specialist,
                                              description: description,
                                              price: price,
                                              propic: propic,
                                              schedule:
                                                  DateTime.now().toString(),
                                              typeConsul: 'chat',
                                            ),
                                          )),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .callDetailDoctorEleventh,
                                        // 'Konsultasi Sekarang',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .callDetailDoctorTwelfth,
                                      // 'Konsultasi akan dimulai sekarang juga',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: reguler,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chevron_right_rounded))
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          thickness: 1,
                          color: blackColor,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, right: 15, left: 19),
                          child: Row(
                            children: [
                              Iconify(
                                MaterialSymbols.date_range_outline,
                                color: colorStyleFifth,
                                size: 29,
                              ),
                              const SizedBox(width: 17),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .callDetailDoctorThirteenth,
                                      // 'Konsultasi Nanti',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .callDetailDoctorFourteenth,
                                      // 'Atur Tanggal & Waktu konsultasimu',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: reguler,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chevron_right_rounded))
                            ],
                          ),
                        ),
                      ]),
                    );
                  },
                ),
                buttonColor: colorStyleFifth,
                child: Text(
                  'Call',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: bold, color: whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
