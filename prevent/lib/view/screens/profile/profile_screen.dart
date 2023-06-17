import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:intl/intl.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/profile/edit_profile_screen.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';
import 'package:prevent/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        drawer: const SideBar(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                padding: const EdgeInsets.only(left: 10),
                icon: const Iconify(
                  Ph.list,
                  size: 36,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text(
            AppLocalizations.of(context)!.profileFirst,
            // 'Profile',
            style: GoogleFonts.inter(fontSize: 16, fontWeight: semiBold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: whiteColor,
          foregroundColor: blackColor,
        ),
        body: SingleChildScrollView(child: Consumer<ProfileViewModel>(
          builder: (context, value, _) {
            if (value.isLoading && value.errorMessage.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (value.errorMessage.isNotEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text('Terjadi Error')),
                  TextButton(
                      onPressed: () {
                        value.getProfile();
                      },
                      child: const Text('coba Ulang')),
                  const Text(
                      'Kami sarankan untuk logOut lalu buka ulang aplikasi')
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: colorNavBar,
                      backgroundImage:
                          const AssetImage('assets/images/dummy_profile.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                  userProfile: value.userProfile),
                            ));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.profileSecond,
                            // 'Edit',
                            style: GoogleFonts.inter(
                                color: blackColor, fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.edit_outlined,
                            color: blackColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 380,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Nama
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.profileThird,
                                // 'Nama',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            ),
                            const Text(
                              ':\t',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                // AppLocalizations.of(context)!.titleEmail,
                                value.userProfile.fullname,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            )
                          ],
                        ),

                        // Username
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.profileFourth,
                                // 'Username',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            ),
                            const Text(
                              ':\t',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                value.userProfile.username,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            )
                          ],
                        ),

                        // No Telpon
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.profileFifth,
                                // 'No. Telp',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            ),
                            const Text(
                              ':\t',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                value.userProfile.telpon,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            )
                          ],
                        ),

                        // Email
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.profileSixth,
                                // 'Email',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            ),
                            const Text(
                              ':\t',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                value.userProfile.email,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            ),
                          ],
                        ),

                        // Alamat
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.profileSeventh,
                                // 'Alamat',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            ),
                            const Text(
                              ':\t',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  value.userProfile.alamat,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(fontSize: 16),
                                ))
                          ],
                        ),

                        // Jenis Kelamin
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.profileEighth,
                                // 'Jenis Kelamin',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            ),
                            const Text(
                              ':\t',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  value.userProfile.gender == 'L'
                                      ? 'Laki-laki'
                                      : 'Perempuan',
                                  style: GoogleFonts.inter(fontSize: 16),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                AppLocalizations.of(context)!.profileTenth,
                                // 'Tanggal Lahir',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                            ),
                            const Text(
                              ':\t',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  DateFormat('DD/MM/yyyy').format(
                                      DateTime.parse(
                                          value.userProfile.birthdate)),
                                  style: GoogleFonts.inter(fontSize: 16),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        )));
  }
}
