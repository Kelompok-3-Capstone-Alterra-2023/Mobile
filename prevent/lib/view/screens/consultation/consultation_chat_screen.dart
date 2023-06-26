import 'package:flutter/material.dart';
import 'package:prevent/models/recipe_medicine.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/home/home_screen.dart';
import 'package:prevent/view/widgets/chat_bubble_consultation.dart';
import 'package:prevent/view/screens/home/home_page.dart';
import 'package:prevent/view_models/chat_view_model.dart';
import 'package:prevent/view_models/doctor_view_model.dart';
import 'package:provider/provider.dart';

import '../../../models/doctor_model.dart';

class ConsultationChatScreen extends StatefulWidget {
  const ConsultationChatScreen(
      {super.key, required this.idDoctor, required this.doctor});
  final Doctor doctor;
  final int idDoctor;

  @override
  State<ConsultationChatScreen> createState() => _ConsultationChatScreenState();
}

class _ConsultationChatScreenState extends State<ConsultationChatScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatViewModel>().initializeWebSocket();
  }

  @override
  Widget build(BuildContext context) {
    final ChatViewModel provider =
        Provider.of<ChatViewModel>(context, listen: false);
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
                                builder: (context) => const HomeScreen()));
                        provider.messages = [];
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 8),
                    Text(widget.doctor.fullName),
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
      body: Column(
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
                  color: shadowText, fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<ChatViewModel>(
                    builder: (context, value, child) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: value.messages.length,
                        itemBuilder: (context, index) {
                          final chat = value.messages[index];
                          return ChatBubbleConsultation(
                              text: "${chat['message']}",
                              isSender: chat['to'] == widget.idDoctor);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: MediaQuery.of(context).viewInsets,
          height: 70,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            InkWell(
              onTap: () => doctorPrescription(context, widget.idDoctor),
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border.fromBorderSide(
                    BorderSide(color: Colors.black),
                  ),
                ),
                child: const Icon(
                  Icons.medication_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: TextFormField(
                controller: provider.controller,
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
            InkWell(
              onTap: () => provider.sendMessage(idDoctor: widget.idDoctor),
              child: Container(
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
                  SizedBox(
                    height: 153,
                    width: 153,
                    child: widget.doctor.propic.isEmpty
                        ? Image.asset(
                            'assets/images/doctor_image.png',
                          )
                        : Image.network(widget.doctor.propic),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctor.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.doctor.specialist,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.doctor.description,
                        style: const TextStyle(
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

  Future<dynamic> doctorPrescription(BuildContext context, int idDoctor) async {
    RecipeModel recipeMedicine =
        await context.read<DoctorViewModel>().getRecipe(idDoctor: idDoctor);
    if (mounted) {
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
                      child: Consumer<DoctorViewModel>(
                        builder: (context, value, child) {
                          // RecipeModel recipeMedicine =  value.getRecipe(idDoctor: idDoctor) as RecipeModel;
                          if (recipeMedicine.recipt.drugs!.isEmpty) {
                            return const Text(
                              'Doktor belum memberikan resep obat, harap konfirmasi kepada doktor terkait resep obat',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF8A8A8A),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: recipeMedicine.recipt.drugs!.length,
                            itemBuilder: (context, index) {
                              final String? medicine =
                                  recipeMedicine.recipt.drugs![index].nama;
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
                                  Text(
                                    medicine!,
                                    style: const TextStyle(fontSize: 15),
                                  )
                                ],
                              );
                            },
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
                              builder: (context) => const HomePage()));
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
