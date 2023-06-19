import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/confirm_payment/confirm_chat_payment_screen.dart';

class PaymentChatScreen extends StatefulWidget {
  PaymentChatScreen({Key? key}) : super(key: key);

  @override
  State<PaymentChatScreen> createState() => _PaymentChatScreenState();
}

class _PaymentChatScreenState extends State<PaymentChatScreen> {
  @override
  Widget build(BuildContext context) {
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
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/doctor_image.png')),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fauzan',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Psikolog Klinis',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: reguler),
                        ),
                        Text(
                          'Trauma, Stress, Depresi',
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
                          'Sesi Konsultasi via Chat',
                          style: GoogleFonts.poppins(
                              fontSize: 10, fontWeight: reguler),
                        ),
                        Text(
                          'Rp200.000',
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
                          'Rp200.000',
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
                      child: const PaymentRadio(),
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
                          'Rp202.000',
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ConfirmChatPaymentScreen()));
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

class PaymentRadio extends StatefulWidget {
  const PaymentRadio({super.key});

  @override
  _PaymentRadioState createState() => _PaymentRadioState();
}

class _PaymentRadioState extends State<PaymentRadio> {
  late String selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 'qris';
  }

  setSelectedRadio(String value) {
    setState(() {
      selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          value: 'qris',
          groupValue: selectedRadio,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                'Rp2.000',
                style: GoogleFonts.poppins(fontSize: 15),
              )
            ],
          ),
          onChanged: (value) {
            setSelectedRadio(value!);
          },
        ),
        RadioListTile(
          value: 'gopay',
          groupValue: selectedRadio,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                'Rp2.500',
                style: GoogleFonts.poppins(fontSize: 15),
              )
            ],
          ),
          onChanged: (value) {
            setSelectedRadio(value!);
          },
        ),
        RadioListTile(
          value: 'dana',
          groupValue: selectedRadio,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                'Rp1.500',
                style: GoogleFonts.poppins(fontSize: 15),
              )
            ],
          ),
          onChanged: (value) {
            setSelectedRadio(value!);
          },
        ),
        RadioListTile(
          value: 'linkaja',
          groupValue: selectedRadio,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                'Rp1.500',
                style: GoogleFonts.poppins(fontSize: 15),
              )
            ],
          ),
          onChanged: (value) {
            setSelectedRadio(value!);
          },
        ),
      ],
    );
  }
}
