import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/profile/edit_form_widget.dart';
import 'package:prevent/view/widgets/foz_button.dart';
import 'package:prevent/view/widgets/home/side_bar.dart';
import '../../../util/common.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Ananda Putri');
  final usernameController = TextEditingController(text: 'Anandap');
  final phoneController = TextEditingController(text: '0895317776543');
  final emailController = TextEditingController(text: 'Ini Email User');
  final addressController =
      TextEditingController(text: 'anandaptri12@gmail.com');
  final bornDateController = TextEditingController();
  final ValueNotifier<String> selectedGender = ValueNotifier('');
  late final ValueNotifier<List<DateTime?>> _dialogCalendarPickerValue =
      ValueNotifier([]);
  final ValueNotifier<String> errorGender = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: const SideBar(),
      appBar: AppBar(
        leadingWidth: 30,
        elevation: 0,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
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
          AppLocalizations.of(context)!.profileFirst,
          // 'Profile',
          style: GoogleFonts.inter(fontSize: 16, fontWeight: semiBold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          Center(
            child: Stack(
              children: [
                Positioned(
                  child: CircleAvatar(
                    radius: 85,
                    backgroundColor: colorNavBar,
                    backgroundImage:
                        const AssetImage('assets/images/dummy_profile.png'),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                        radius: 22,
                        backgroundColor: const Color(0XFF87AF5B),
                        child: Icon(
                          Icons.camera_enhance,
                          color: whiteColor,
                        )),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 17),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormEdit(
                  nameController: nameController,
                  label: AppLocalizations.of(context)!.profileThird,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                FormEdit(
                  nameController: usernameController,
                  label: AppLocalizations.of(context)!.profileFourth,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                FormEdit(
                  inputType: TextInputType.number,
                  nameController: phoneController,
                  label: AppLocalizations.of(context)!.profileFifth,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Nomor Handphone tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                FormEdit(
                  inputType: TextInputType.emailAddress,
                  nameController: emailController,
                  label: AppLocalizations.of(context)!.profileSixth,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                FormEdit(
                  nameController: addressController,
                  label: AppLocalizations.of(context)!.profileSeventh,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.profileEighth,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: semiBold),
                ),
                ValueListenableBuilder(
                    valueListenable: selectedGender,
                    builder: (context, value, _) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                              fillColor:
                                  MaterialStatePropertyAll(colorStyleFifth),
                              value: 'Perempuan',
                              groupValue: value,
                              onChanged: (value) {
                                selectedGender.value = value.toString();
                              }),
                          Text(
                            'Perempuan',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: medium),
                          ),
                          const SizedBox(width: 15),
                          Radio(
                              fillColor:
                                  MaterialStatePropertyAll(colorStyleFifth),
                              value: 'Laki - laki',
                              groupValue: value,
                              onChanged: (value) {
                                selectedGender.value = value.toString();
                              }),
                          Text(
                            'Laki - laki',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: medium),
                          ),
                        ],
                      );
                    }),
                ValueListenableBuilder(
                  valueListenable: errorGender,
                  builder: (context, value, _) {
                    if (errorGender.value == 'Error') {
                      return Text('  Gender tidak boleh kosong',
                          style: TextStyle(
                              color: Colors.red.shade700, fontSize: 13));
                    } else {
                      return const Text('');
                    }
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.profileTenth,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(height: 5),
                ValueListenableBuilder(
                    valueListenable: _dialogCalendarPickerValue,
                    builder: (context, value, _) {
                      return TextFormField(
                        onTap: () async {
                          final values = await showCalendarDatePicker2Dialog(
                            context: context,
                            config: CalendarDatePicker2WithActionButtonsConfig(
                                cancelButtonTextStyle:
                                    TextStyle(color: colorStyleFifth),
                                cancelButton: Container(
                                  height: 30,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: greyColor)),
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, fontWeight: semiBold),
                                    ),
                                  ),
                                ),
                                okButton: Container(
                                  height: 30,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: colorStyleFifth),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)!.apply,
                                      // 'Apply',
                                      style: GoogleFonts.poppins(
                                          color: whiteColor,
                                          fontSize: 14,
                                          fontWeight: semiBold),
                                    ),
                                  ),
                                ),
                                okButtonTextStyle:
                                    TextStyle(color: colorStyleFifth),
                                selectedDayHighlightColor: colorStyleFifth,
                                centerAlignModePicker: true),
                            dialogSize: const Size(325, 400),
                            borderRadius: BorderRadius.circular(15),
                            value: _dialogCalendarPickerValue.value,
                            dialogBackgroundColor: whiteColor,
                          );
                          if (values != null) {
                            _dialogCalendarPickerValue.value = values;
                            bornDateController.text = _dialogCalendarPickerValue
                                .value
                                .map((e) => DateFormat('dd/MM/yyyy').format(e!))
                                .join(',');
                          }
                        },
                        enabled: true,
                        readOnly: true,
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: reguler),
                        controller: bornDateController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.date_range,
                              color: colorStyleFifth,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 18),
                            filled: true,
                            fillColor: colorStyleSecond,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tanggal Lahir tidak boleh kosong';
                          }
                          return null;
                        },
                      );
                    }),
                const SizedBox(height: 25),
                Center(
                  child: FozButton(
                    width: 295,
                    buttonColor: colorStyleFifth,
                    child: Text(
                      AppLocalizations.of(context)!.profileSimpan,
                      // 'Save',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: bold, color: whiteColor),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate() &&
                          selectedGender.value != '') {
                        errorGender.value = '';
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              insetPadding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              content: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 5, color: successThird)),
                                      child: Icon(
                                        Icons.done,
                                        color: successThird,
                                        size: 74,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Text(
                                      'Profil berhasil disimpan',
                                      style: GoogleFonts.poppins(
                                          fontWeight: bold, fontSize: 15),
                                    ),
                                    const SizedBox(height: 75),
                                    Text(
                                      'Ketuk dimana saja untuk menutup halaman ini',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: bold,
                                          fontSize: 10,
                                          color: greyColor),
                                    ),
                                  ],
                                ),
                              )),
                        );
                        if (mounted) {
                          Navigator.pop(context);
                        }
                      } else if (selectedGender.value != '') {
                        errorGender.value = '';
                      } else {
                        errorGender.value = 'Error';
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
