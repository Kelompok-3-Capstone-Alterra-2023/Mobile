import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:prevent/util/theme.dart';
import 'package:provider/provider.dart';

import '../../../view_models/notifification_view_model.dart';

class SearchNotificationScreen extends StatefulWidget {
  const SearchNotificationScreen({Key? key}) : super(key: key);

  @override
  State<SearchNotificationScreen> createState() =>
      _SearchNotificationScreenState();
}

class _SearchNotificationScreenState extends State<SearchNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(74),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: TextField(
              onChanged: (value) {
                final searchProvider =
                    Provider.of<NotificationViewModel>(context, listen: false);
                searchProvider.setSearchText(value);
                context.read<NotificationViewModel>().filterData();
              },
              autofocus: true,
              cursorColor: blackColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFEEEEEE),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                ),
                focusColor: const Color(0xFFEEEEEE),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Iconify(
                    Eva.search_outline,
                    color: blackColor,
                    size: 45,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<NotificationViewModel>(
        builder: (context, value, child) {
          if (value.filteredConsultations.isEmpty) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 76),
                  Image.asset(
                    'assets/images/article_not_found.png',
                    height: 313,
                    width: 326,
                  ),
                  const SizedBox(height: 19),
                  const Text('Opps! Pencarian kamu tidak ditemukan'),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: ListView.builder(
                itemCount: value.filteredConsultations.length,
                itemBuilder: (context, index) {
                  final notification = value.filteredConsultations[index];
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DetailArticleScreen(
                      //               id: item.,
                      //             )));
                    },
                    child: SizedBox(
                      // height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: blackColor),
                              ),
                              child: Image.asset(
                                notification.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notification.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    Text(
                                      notification.message,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: reguler,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        const Iconify(
                                          Zondicons.time,
                                          size: 12,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          notification.dateTime,
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: reguler,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
