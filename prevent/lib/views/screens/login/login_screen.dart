import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:prevent/main.dart';
import 'package:prevent/views/screens/login/login_view_model.dart';
import 'package:provider/provider.dart';

import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final primaryColor = const Color(0xff7CA153);
  final secondaryColor = const Color(0xff506736);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 80),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Sign In',
              style: GoogleFonts.poppins(
                  color: secondaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              'Hallo Selamat Datang di Aplikasi Prevent!, Untuk masuk silahkan isi data kamu terlebih dahulu ya!',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 45,
            ),
            Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: provider.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong!';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff757575)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        label: Text(
                          'Email',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, color: primaryColor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
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
                          borderSide:
                              const BorderSide(color: Color(0xff757575)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        label: Text(
                          'Password',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, color: primaryColor),
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
                                ? Colors.grey[700]
                                : primaryColor,
                          ),
                          onPressed: () {
                            provider.toggleObscureText();
                          },
                        ),
                        focusColor: primaryColor,
                        fillColor: const Color(0xffffffff),
                        filled: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: primaryColor),
                                child: Checkbox(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  activeColor: primaryColor,
                                  value: provider.rememberMe,
                                  onChanged: (value) {
                                    provider.toggleRememberMe();
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Remember Me',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lupa Password?',
                            style: GoogleFonts.poppins(
                                color: secondaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          final form = provider.formKey;
                          if (form.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const MyHomePage(title: 'My Homepage');
                              },
                            ), (route) => false);
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Atau Sign In dengan',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              side: BorderSide(color: primaryColor)),
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
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: primaryColor),
                              ),
                            ]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Belum punya akun?',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            ), (route) => false);
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: secondaryColor),
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
