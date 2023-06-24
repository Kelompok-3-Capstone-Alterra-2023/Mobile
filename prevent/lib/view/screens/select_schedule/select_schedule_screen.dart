// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/raphael.dart';
import 'package:intl/intl.dart';
import 'package:prevent/view/screens/payment/payment_screen.dart';
import 'package:prevent/view_models/schedule_view_model.dart';
import 'package:provider/provider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';

class SelectScheduleScreen extends StatefulWidget {
  final int id;
  final String fullName;
  final String specialist;
  final String description;
  final int price;
  final String propic;
  final String typeConsul;
  const SelectScheduleScreen(
      {super.key,
      required this.fullName,
      required this.id,
      required this.specialist,
      required this.description,
      required this.price,
      required this.propic,
      required this.typeConsul});

  @override
  State<SelectScheduleScreen> createState() => _SelectScheduleScreenState();
}

class _SelectScheduleScreenState extends State<SelectScheduleScreen> {
  String? selectedTime;

  Map<String, List<String>> timeOptions = {
    'time1': ['08:00', '09:00', '10:00', '11:00'],
    'time2': ['13:00', '14:00'],
    'time3': ['16:00', '17:00'],
    'time4': ['19:00'],
  };

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScheduleOrderViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          AppLocalizations.of(context)!.selectScheduleFirst,
          // 'Pilih Jadwal',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                children: [
                  SizedBox(
                    child: widget.propic.isEmpty
                        ? Image.asset(
                            'assets/images/doctor1.png',
                            height: 112,
                            width: 107,
                          )
                        : Image.network(
                            widget.propic,
                            height: 112,
                            width: 107,
                          ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.fullName,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: medium),
                      ),
                      Text(
                        widget.specialist,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: medium),
                      ),
                      Text(
                        widget.description,
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: reguler),
                      ),
                      Text(
                        NumberFormat.simpleCurrency(name: 'IDR')
                            .format(widget.price),
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: medium),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            SizedBox(
              height: 600,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: colorStyleFirst,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, left: 14, right: 14),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.selectScheduleFourth,
                          // 'Pilih Tanggal & Waktu Konsultasi',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        WeeklyDatePicker(
                          backgroundColor: colorStyleFirst,
                          weekdays: const [
                            'Sen',
                            'Sel',
                            'Rab',
                            'Kam',
                            'Jum',
                            'Sab',
                            'Min',
                          ],
                          selectedBackgroundColor: colorStyleFifth,
                          enableWeeknumberText: false,
                          selectedDigitColor: whiteColor,
                          digitsColor: blackColor,
                          weekdayTextColor: blackColor,
                          selectedDay: provider.selectedDay,
                          changeDay: provider.changeDay,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 269,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            color: whiteColor,
                            child: ListView.builder(
                              itemCount: timeOptions.length,
                              itemBuilder: (context, index) {
                                String key = timeOptions.keys.elementAt(index);
                                Iterable<String> times = timeOptions[key]!;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: 8.0,
                                      children: times.map((time) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: ChoiceChip(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3, vertical: 2),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                    color: colorStyleFifth)),
                                            label: Text(time),
                                            selected: selectedTime == time,
                                            onSelected: (isSelected) {
                                              setState(() {
                                                if (isSelected) {
                                                  selectedTime = time;
                                                } else {
                                                  selectedTime = null;
                                                }
                                              });
                                            },
                                            selectedColor: colorStyleFifth,
                                            labelStyle: TextStyle(
                                                color: selectedTime == time
                                                    ? whiteColor
                                                    : colorStyleFifth,
                                                fontWeight: medium,
                                                fontSize: 10),
                                            backgroundColor: whiteColor,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: greyColor,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorStyleFifth,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onPressed: () {
                              if (selectedTime == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please choose time first!'),
                                  ),
                                );
                              } else {
                                showBottomSheet(context);
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)!.selectScheduleFifth,
                              // 'Selanjutnya',
                              style: GoogleFonts.poppins(
                                  fontWeight: bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: whiteColor.withAlpha(0),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
          height: 375,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
            child: Column(children: [
              Text(
                'Ketika sudah menjadwalkan konsultasi, Mohon diingat agar...',
                style: TextStyle(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 33,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: colorStyleFifth,
                        borderRadius: BorderRadius.circular(15)),
                    child: Iconify(
                      Raphael.clock,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Mengikuti konsultasi ',
                      style: TextStyle(fontSize: 11, color: blackColor),
                      children: [
                        TextSpan(
                          text: 'tepat waktu, ',
                          style: TextStyle(fontWeight: semiBold),
                        ),
                        const TextSpan(
                          text:
                              'dokter akan menunggu \ndi sesi konsultasi hingga anda hadir selama 10 menit.',
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: colorStyleFifth,
                        borderRadius: BorderRadius.circular(15)),
                    child: SvgPicture.asset(
                        'assets/icons/solar_call-chat-bold.svg',
                        color: whiteColor),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Memberi kabar kepada Dokter jika ingin',
                      style: TextStyle(fontSize: 11, color: blackColor),
                      children: [
                        TextSpan(
                          text: ' membatalkan \njanji konsultasi',
                          style: TextStyle(fontWeight: semiBold),
                        ),
                        const TextSpan(
                          text:
                              ' selambat-lambatnya 30 menit sebelum \njadwal yang ditentukan.',
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: colorStyleFifth,
                        borderRadius: BorderRadius.circular(15)),
                    child: Iconify(
                      Healthicons.call_centre,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Menginformasikan Customer Service jika',
                      style: TextStyle(fontSize: 11, color: blackColor),
                      children: [
                        TextSpan(
                          text: ' terdapat',
                          style: TextStyle(fontWeight: semiBold),
                        ),
                        const TextSpan(
                          text:
                              ' \nkendala pada pengembalian dana ataupun Dokter yang \ntidak dapat hadir pada sesi konsultasi.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorStyleFifth,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () {
                      final provider = Provider.of<ScheduleOrderViewModel>(
                          context,
                          listen: false);
                      debugPrint(
                          'tanggal ${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(provider.selectedDay)} jam $selectedTime');
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          final time =
                              '${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(provider.selectedDay)} $selectedTime:00 WIB';
                          return PaymentScreen(
                            id: widget.id,
                            fullName: widget.fullName,
                            specialist: widget.specialist,
                            description: widget.description,
                            price: widget.price,
                            propic: widget.propic,
                            schedule: time,
                            typeConsul: 'chat',
                          );
                        },
                      ));
                    },
                    child: Text(
                      'Oke',
                      style:
                          GoogleFonts.poppins(fontWeight: bold, fontSize: 12),
                    ),
                  ))
            ]),
          ),
        );
      },
    );
  }
}
