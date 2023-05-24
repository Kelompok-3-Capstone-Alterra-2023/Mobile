import 'package:flutter/material.dart';
import 'package:prevent/util/theme.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    'Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
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
                      children: const [
                        Text(
                          'Fauzan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Psikolog Klinis',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Trauma, Stress, Depresi',
                          style: TextStyle(fontSize: 10),
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
                    const Text(
                      'Rincian Biaya',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Sesi Konsultasi via Chat',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Rp200.000',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const Text(
                      'ID : 123ECD345',
                      style: TextStyle(fontSize: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Sub Total',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp200.000',
                          style: TextStyle(
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
                    const Text(
                      'Pilih Metode Pembayaran',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: PaymentRadio(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total Biaya',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Rp202.000',
                          style: TextStyle(
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
                onPressed: () {},
                child: const Text(
                  'Bayar',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
              const Text(
                'Qris',
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                'Rp2.000',
                style: TextStyle(fontSize: 15),
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
              const Text(
                'GoPay',
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                'Rp2.500',
                style: TextStyle(fontSize: 15),
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
              const Text(
                'Dana',
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                'Rp1.500',
                style: TextStyle(fontSize: 15),
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
              const Text(
                'LinkAja',
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                'Rp1.500',
                style: TextStyle(fontSize: 15),
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
