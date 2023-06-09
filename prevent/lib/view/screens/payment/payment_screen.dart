import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/payment/confirm_payment_screen.dart';
import 'package:prevent/view_models/payment_view_model.dart';
import 'package:prevent/view_models/schedule_view_model.dart';
import 'package:provider/provider.dart';

import '../../../models/doctor_model.dart';

class PaymentScreen extends StatefulWidget {
  final Doctor doctor;
  final String schedule;
  final String typeConsul;
  const PaymentScreen({
    Key? key,
    required this.typeConsul,
    required this.doctor,
    required this.schedule,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final PaymentViewModel provider =
        Provider.of<PaymentViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            splashRadius: 18,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: blackColor,
            )),
        title: Text(
          'Pembayaran',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Divider(
                thickness: 5,
                color: Color(0xffececec),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: widget.doctor.propic.isEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/doctor1.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.doctor.propic,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctor.fullName,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          widget.doctor.specialist,
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: reguler),
                        ),
                        Text(
                          widget.doctor.description,
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: reguler),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 5,
                color: Color(0xffececec),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rincian Biaya',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.typeConsul == 'chat'
                              ? 'Sesi Konsultasi via Chat'
                              : 'Sesi Konsultasi via Call',
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: reguler),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(widget.doctor.price),
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: reguler),
                        ),
                      ],
                    ),
                    Text(
                      'ID : 123ECD345',
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: reguler),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(widget.doctor.price),
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 5,
                color: Color(0xffececec),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pilih Metode Pembayaran',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Consumer<PaymentViewModel>(
                        builder: (context, value, child) {
                          return Column(
                            children: <Widget>[
                              RadioListTile(
                                value: 'qris',
                                groupValue: provider.selectedRadio,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/Qris.png',
                                      width: 64,
                                      height: 32,
                                    ),
                                    Text(
                                      'Qris',
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    ),
                                    Text(
                                      NumberFormat.simpleCurrency(name: 'IDR')
                                          .format(2000),
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    )
                                  ],
                                ),
                                onChanged: (value) {
                                  provider.setSelectedRadio(value!);
                                },
                              ),
                              RadioListTile(
                                value: 'gopay',
                                groupValue: provider.selectedRadio,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/GoPay.png',
                                      width: 64,
                                      height: 32,
                                    ),
                                    Text(
                                      'GoPay',
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    ),
                                    Text(
                                      NumberFormat.simpleCurrency(name: 'IDR')
                                          .format(2000),
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    )
                                  ],
                                ),
                                onChanged: (value) {
                                  provider.setSelectedRadio(value!);
                                },
                              ),
                              RadioListTile(
                                value: 'dana',
                                groupValue: provider.selectedRadio,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/Dana.png',
                                      width: 64,
                                      height: 32,
                                    ),
                                    Text(
                                      'Dana',
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    ),
                                    Text(
                                      NumberFormat.simpleCurrency(name: 'IDR')
                                          .format(2000),
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    )
                                  ],
                                ),
                                onChanged: (value) {
                                  provider.setSelectedRadio(value!);
                                },
                              ),
                              RadioListTile(
                                value: 'linkaja',
                                groupValue: provider.selectedRadio,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/LinkAja.png',
                                      width: 64,
                                      height: 32,
                                    ),
                                    Text(
                                      'LinkAja',
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    ),
                                    Text(
                                      NumberFormat.simpleCurrency(name: 'IDR')
                                          .format(2000),
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    )
                                  ],
                                ),
                                onChanged: (value) {
                                  provider.setSelectedRadio(value!);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Biaya',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: 'IDR')
                              .format(widget.doctor.price + 2000),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(colorStyleFifth)),
                onPressed: () async {
                  try {
                    await context.read<ScheduleOrderViewModel>().scheduleOrder(
                          widget.doctor.id,
                          widget.schedule.toString(),
                          2000,
                          widget.doctor.price,
                          widget.typeConsul,
                          provider.selectedRadio,
                        );
                    if (context.mounted) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ConfirmPayment(
                            doctor: widget.doctor,
                            typeConsul: widget.typeConsul,
                            timeTransaction: widget.schedule,
                          );
                        },
                      ));
                    }
                  } catch (e) {
                    rethrow;
                  }
                },
                child: Text(
                  'Bayar',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
