import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:intl/intl.dart';
import 'package:prevent/view/screens/verification_code/verification_code_screen.dart';
import 'package:prevent/view_models/register_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/theme.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 60),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                  color: colorStyleSeventh, fontSize: 32, fontWeight: bold),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              'Halo selamat datang di aplikasi prevent!, untuk mendaftar silahkan lengkapi data diri terlebih dahulu!',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: reguler, color: blackColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: provider.usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username tidak boleh kosong!';
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
                          'Username',
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
                      controller: provider.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username tidak boleh kosong!';
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
                          'Email',
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
                      controller: provider.tanggalController =
                          TextEditingController(
                        text: DateFormat('dd/MM/yyyy').format(provider.date),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tanggal lahir tidak boleh kosong!';
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
                          'Tanggal Lahir',
                          style: GoogleFonts.poppins(
                              fontWeight: reguler, color: blackColor),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              provider.selectDate(context, provider);
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
                      obscureText: provider.obscureText,
                      controller: provider.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong!';
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
                          'Password',
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
                            provider.obscureText
                                ? Eva.eye_off_outline
                                : Eva.eye_outline,
                            color: provider.obscureText
                                ? greyColor
                                : colorStyleFifth,
                          ),
                          onPressed: () {
                            provider.toggleObscureText();
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
                      obscureText: provider.obscureText,
                      controller: provider.confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong!';
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
                          'Confirm Password',
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
                            provider.obscureText
                                ? Eva.eye_off_outline
                                : Eva.eye_outline,
                            color: provider.obscureText
                                ? greyColor
                                : colorStyleFifth,
                          ),
                          onPressed: () {
                            provider.toggleObscureText();
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
                        onPressed: () {
                          final form = provider.formKey;
                          if (form.currentState!.validate()) {
                            // Navigator.pushAndRemoveUntil(context,
                            //     MaterialPageRoute(
                            //   builder: (context) {
                            //     return const MyHomePage(title: 'My Homepage');
                            //   },
                            // ), (route) => false);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VerificationCodeScreen()));
                          }
                        },
                        child: Text(
                          'Sign Up',
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
                            'Atau Sign Up dengan',
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
                                'Google',
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
                        Text('Sudah Punya Akun?',
                            style: GoogleFonts.poppins(
                              fontWeight: reguler,
                              fontSize: 12,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ), (route) => false);
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                                fontWeight: bold,
                                fontSize: 12,
                                color: colorStyleSeventh),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
