import 'package:flutter/material.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/widgets/chat_bubble_consultation.dart';
import 'package:prevent/view/widgets/home/menu_home.dart';

class ConsultationChatScreen extends StatefulWidget {
  const ConsultationChatScreen({super.key});

  @override
  State<ConsultationChatScreen> createState() => _ConsultationChatScreenState();
}

class _ConsultationChatScreenState extends State<ConsultationChatScreen> {
  List<dynamic> chatList = [
    [
      "Hai, perkenalkan nama saya dokter Alfiansyah apa yang dapat saya bantu hari ini?",
      true
    ],
    [
      "Saya ingin berkonsultasi terkait perasaan yang saya alami ketika keluarga saya terus memaksakan hal-hal yang tidak saya sukai.",
      false
    ],
    ["Saya sering menyendiri", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(74),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuHome()));
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 8),
                    const Text('Nama dokter'),
                  ],
                ),
                InkWell(
                  onTap: () {
                    doctorDetail(context);
                  },
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'i',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: InkWell(
        onTap: () {
          // doctorPrescription(context);
          exitChatDialog(context);
        },
        child: Column(
          children: [
            const SizedBox(height: 44),
            const Text(
              'Konsultasi dengan Dokter',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65, right: 65, top: 20),
              child: Text(
                'Mohon diingat bahwa sesi konsultasi dengan dokter bersifat tertutup dan konsultasi anda dengan dokter bersifat pribadi dan hanya bersifat 2 arah, kami mengimbau user untuk berbicara dengan dokter dengan sepenuh hati dan tanpa perlu ditahan. Sehat selalu!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: shadowText,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: chatList.length,
                      itemBuilder: (context, index) {
                        final chat = chatList[index];
                        return ChatBubbleConsultation(
                            text: chat[0], isSender: chat[1]);
                      },
                    ),
                    // MessageBar(
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: MediaQuery.of(context).viewInsets,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Colors.grey,
              )
            ],
            color: Colors.grey[100],
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.fromBorderSide(
                  BorderSide(color: blackColor),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 24,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  hintText: "Type here...",
                  hintStyle: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 25),
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.fromBorderSide(
                  BorderSide(color: blackColor),
                ),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.black,
                size: 24,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<dynamic> doctorDetail(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              height: 367,
              width: 340,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Container(
                      height: 36,
                      width: double.infinity,
                      color: const Color(0xFFC9EAA4),
                      child: const Center(
                          child: Text(
                        'Detail',
                        style: TextStyle(fontSize: 12),
                      )),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Image.asset(
                    'assets/images/doctor_image.png',
                    height: 153,
                    width: 153,
                  ),
                  const SizedBox(height: 24),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fauzan Hakim M.Psi, Psi',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Psikolog Klinis',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Trauma, Stress, Depresi',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    ' Ketuk dimana saja untuk menutup halaman ini.',
                    style: TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> doctorPrescription(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              height: 300,
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Container(
                      height: 36,
                      width: double.infinity,
                      color: const Color(0xFFC9EAA4),
                      child: const Center(
                        child: Text(
                          'Resep obat dan aturan dosis pemakaian',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 18),
                            Image.asset(
                              'assets/images/Cefadoxil.png',
                              height: 43,
                              width: 60,
                            ),
                            const SizedBox(width: 35),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cefadroxil 1x500Mg',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '2x1 konsumsi sehabis makan',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 35),
                    child: Text(
                      'Ketuk dimana saja untuk menutup halaman ini.',
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> exitChatDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              height: 400,
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Container(
                      height: 36,
                      width: double.infinity,
                      color: const Color(0xFFFED702),
                      child: const Center(
                        child: Text(
                          'Permintaan tutup sesi oleh dokter',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 76),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'Sesi akan ditutup oleh Dokter, kamu dapat mengakses kembali riwayat chat dengan Dokter melalui halaman riwayat konsultasi. Kamu juga dapat melihat diagnosa akhir serta resep obat yang dianjurkan oleh Dokter melalui halaman riwayat konsultasi.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 76),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuHome()));
                    },
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ))),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF365030)),
                      fixedSize: MaterialStatePropertyAll(
                        Size(163, 35),
                      ),
                    ),
                    child: const Text(
                      'Tutup Sesi Konsutasi',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
