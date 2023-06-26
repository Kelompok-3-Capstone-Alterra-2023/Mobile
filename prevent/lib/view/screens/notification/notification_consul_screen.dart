import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/notification/search_notification_screen.dart';
import 'package:provider/provider.dart';

import '../../../view_models/notifification_view_model.dart';

class NotificationKonsulScreen extends StatefulWidget {
  const NotificationKonsulScreen({super.key});

  @override
  State<NotificationKonsulScreen> createState() =>
      _NotificationKonsulScreenState();
}

class _NotificationKonsulScreenState extends State<NotificationKonsulScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationViewModel>().getNotificationConsul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Konsultasi',
          style: GoogleFonts.inter(
              fontWeight: bold, fontSize: 15, color: blackColor),
        ),
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchNotificationScreen(),
                ),
              );
            },
            icon: Iconify(
              Zondicons.search,
              size: 24,
              color: blackColor,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Consumer<NotificationViewModel>(
                builder: (context, value, child) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      color: blackColor,
                    ),
                    itemCount: value.consultations.length,
                    itemBuilder: (context, index) {
                      final notification = value.consultations[index];
                      return InkWell(
                        onTap: () {},
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
