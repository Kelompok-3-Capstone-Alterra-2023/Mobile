// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:prevent/view/screens/forgot_password/forgot_page.dart';
import 'package:prevent/view/screens/home/home_screen.dart';
import 'package:prevent/view_models/home_view_model.dart';
import 'package:prevent/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../util/common.dart';
import '../../../util/theme.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.signIn,
                // 'Sign In',
                style: GoogleFonts.poppins(
                    color: colorStyleSeventh, fontSize: 32, fontWeight: bold),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                AppLocalizations.of(context)!.signInTitle,
                // 'Hallo Selamat Datang di Aplikasi Prevent!, Untuk masuk silahkan isi data kamu terlebih dahulu ya!',
                style: GoogleFonts.poppins(fontSize: 12, fontWeight: reguler),
              ),
              const SizedBox(
                height: 45,
              ),
              Consumer<LoginViewModel>(
                builder: (context, value, child) {
                  return Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.inputEmail;
                              // return 'Email tidak boleh kosong!';
                            } else if (!isEmailValid(value)) {
                              return 'Format email tidak valid';
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
                          height: 45,
                        ),
                        TextFormField(
                          obscureText: value.obscureText,
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
                                value.obscureText
                                    ? Eva.eye_off_outline
                                    : Eva.eye_outline,
                                color: value.obscureText
                                    ? greyColor
                                    : colorStyleFifth,
                              ),
                              onPressed: () {
                                value.toggleObscureText();
                              },
                            ),
                            focusColor: colorStyleFifth,
                            fillColor: whiteColor,
                            filled: true,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const ForgotPassScreen()));
                              },
                              child: Text(
                                AppLocalizations.of(context)!.forgotPass,
                                // 'Lupa Password?',
                                style: GoogleFonts.poppins(
                                    color: colorStyleSeventh,
                                    fontSize: 12,
                                    fontWeight: bold),
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
                                backgroundColor: colorStyleFifth,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  final email = emailController.text;
                                  final password = passwordController.text;
                                  if (context.mounted) {
                                    context
                                        .read<HomeViewModel>()
                                        .selectedIndex = 0;
                                  }
                                  await value.loginUser(email, password);
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return const HomeScreen();
                                    },
                                  ), (route) => false);
                                } catch (e) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Login Failed'),
                                      content: const Text(
                                          'Email or Password doesn\'t match'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                                color: colorStyleFifth),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                            },
                            child: value.isLoading
                                ? CircularProgressIndicator(
                                    color: whiteColor,
                                  )
                                : Text(
                                    AppLocalizations.of(context)!.btnSignIn,
                                    // 'Sign In',
                                    style: GoogleFonts.poppins(
                                        fontWeight: bold, fontSize: 16),
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
                                color: greyColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                AppLocalizations.of(context)!.otherSignIn,
                                // 'Atau Sign In dengan',
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
                          height: 45,
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
                              AppLocalizations.of(context)!.notHaveAccount,
                              // 'Belum punya akun?',
                              style: GoogleFonts.poppins(
                                fontWeight: reguler,
                                fontSize: 12,
                              ),
                            ),
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
                                AppLocalizations.of(context)!.signUp,
                                // 'Sign Up',
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
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
