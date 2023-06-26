import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:intl/intl.dart';
import 'package:prevent/view/screens/verification_code/verification_code_screen.dart';
import 'package:prevent/view_models/register_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final List<DateTime?> _dialogCalendarPickerValue = [
    DateTime.now(),
  ];

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void clearController() {
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.signUp,
                // 'Sign Up',
                style: GoogleFonts.poppins(
                    color: colorStyleSeventh, fontSize: 32, fontWeight: bold),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                AppLocalizations.of(context)!.signUpTitle,
                // 'Halo selamat datang di aplikasi prevent!, untuk mendaftar silahkan lengkapi data diri terlebih dahulu!',
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: reguler, color: blackColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.inputUsername;
                          // return 'Username tidak boleh kosong!';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: colorStyleFifth,
                          ),
                        ),
                        label: Text(
                          AppLocalizations.of(context)!.titleUsername,
                          // 'Username',
                          style: GoogleFonts.poppins(
                              fontWeight: reguler, color: blackColor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.inputEmail;
                          // return 'Email tidak boleh kosong!';
                        } else if (!isEmailValid(value)) {
                          return 'Email Format must be valid!';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: colorStyleFifth,
                          ),
                        ),
                        label: Text(
                          AppLocalizations.of(context)!.titleEmail,
                          // 'Email',
                          style: GoogleFonts.poppins(
                              fontWeight: reguler, color: blackColor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: dateController = TextEditingController(
                        text: provider.date
                            .map((e) => DateFormat('yyyy-MM-dd').format(e!))
                            .join(', '),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.inputDateOfBirth;
                          // return 'Tanggal lahir tidak boleh kosong!';
                        } else {
                          final selectedDate =
                              DateFormat('yyyy-MM-dd').parse(value);
                          final currentDate = DateTime.now();
                          if (isSameDate(selectedDate, currentDate)) {
                            return 'Date of birth can not be the same as today!';
                          }
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: colorStyleFifth,
                          ),
                        ),
                        label: Text(
                          AppLocalizations.of(context)!.titleDateOfBirth,
                          // 'Tanggal Lahir',
                          style: GoogleFonts.poppins(
                              fontWeight: reguler, color: blackColor),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final values =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(
                                        cancelButtonTextStyle:
                                            TextStyle(color: colorStyleFifth),
                                        cancelButton: Container(
                                          height: 30,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border:
                                                  Border.all(color: greyColor)),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .btnCancelled,
                                              // 'Cancel',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: semiBold),
                                            ),
                                          ),
                                        ),
                                        okButton: Container(
                                          height: 30,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: colorStyleFifth),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .apply,
                                              // 'Apply',
                                              style: GoogleFonts.poppins(
                                                  color: whiteColor,
                                                  fontSize: 14,
                                                  fontWeight: semiBold),
                                            ),
                                          ),
                                        ),
                                        lastDate: DateTime.now(),
                                        okButtonTextStyle:
                                            TextStyle(color: colorStyleFifth),
                                        selectedDayHighlightColor:
                                            colorStyleFifth,
                                        centerAlignModePicker: true),
                                dialogSize: const Size(325, 400),
                                borderRadius: BorderRadius.circular(15),
                                value: _dialogCalendarPickerValue,
                                dialogBackgroundColor: whiteColor,
                              );
                              if (values != null) {
                                provider.setDate(values);
                              }
                            },
                            icon: Icon(
                              Icons.date_range_outlined,
                              color: greyColor,
                            )),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: provider.obscurePassword,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.inputPass;
                          // return 'Password tidak boleh kosong!';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: colorStyleFifth,
                          ),
                        ),
                        label: Text(
                          AppLocalizations.of(context)!.titlePass,
                          // 'Password',
                          style: GoogleFonts.poppins(
                              fontWeight: reguler, color: blackColor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Iconify(
                            provider.obscurePassword
                                ? Eva.eye_off_outline
                                : Eva.eye_outline,
                            color: provider.obscurePassword
                                ? greyColor
                                : colorStyleFifth,
                          ),
                          onPressed: () {
                            provider.toggleObscurePassword();
                          },
                        ),
                        focusColor: colorStyleFifth,
                        fillColor: whiteColor,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: provider.obscureConfirmPassword,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!.inputConfirmPass;
                          // return 'Konfirmasi Password tidak boleh kosong!';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords doesn\'t match';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: colorStyleFifth,
                          ),
                        ),
                        label: Text(
                          AppLocalizations.of(context)!.titleConfirmPass,
                          // 'Confirm Password',
                          style: GoogleFonts.poppins(
                              fontWeight: reguler, color: blackColor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Iconify(
                            provider.obscureConfirmPassword
                                ? Eva.eye_off_outline
                                : Eva.eye_outline,
                            color: provider.obscureConfirmPassword
                                ? greyColor
                                : colorStyleFifth,
                          ),
                          onPressed: () {
                            provider.toggleObscureConfirmPassword();
                          },
                        ),
                        focusColor: blackColor,
                        fillColor: whiteColor,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final email = emailController.text;
                            final username = usernameController.text;
                            final password = passwordController.text;
                            final birthdate = dateController.text;
                            try {
                              await provider.registerUser(
                                  email, username, password, birthdate);
                              if (context.mounted) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationCodeScreen(
                                              email: email,
                                              username: username,
                                              password: password,
                                              birthdate: birthdate,
                                            )));
                                clearController();
                              }
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Email Already Registered'),
                                  content: const Text(
                                      'Please proceed to the login page to continue.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                        clearController();
                                      },
                                      child: Text(
                                        'OK',
                                        style:
                                            TextStyle(color: colorStyleFifth),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        child: provider.isLoading
                            ? CircularProgressIndicator(
                                color: whiteColor,
                              )
                            : Text(
                                AppLocalizations.of(context)!.signUp,
                                // 'Sign Up',
                                style: GoogleFonts.poppins(
                                    fontWeight: bold, fontSize: 16),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: greyColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            AppLocalizations.of(context)!.otherSignUp,
                            // 'Atau Sign Up dengan',
                            style: GoogleFonts.poppins(
                                fontWeight: reguler, fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              side: BorderSide(color: colorStyleFifth)),
                        ),
                        onPressed: () {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google-icon.png',
                                height: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppLocalizations.of(context)!.google,
                                // 'Google',
                                style: GoogleFonts.poppins(
                                    fontWeight: reguler,
                                    fontSize: 16,
                                    color: colorStyleFifth),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.haveAccount,
                          // 'Sudah Punya Akun?',
                          style: GoogleFonts.poppins(
                            fontWeight: reguler,
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            clearController();
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ), (route) => false);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            // 'Sign In',
                            style: GoogleFonts.poppins(
                                fontWeight: bold,
                                fontSize: 12,
                                color: colorStyleSeventh),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
