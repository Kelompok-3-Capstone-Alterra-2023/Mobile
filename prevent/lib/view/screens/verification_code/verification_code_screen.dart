import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:prevent/util/theme.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final Color focusedBorderColor = colorStyleFifth;
  final Color borderColor = const Color(0xFFDED9D9);
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      width: 59,
      height: 55,
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),
            const SizedBox(height: 53),
            Text(
              'Kode Verifikasi',
              style: TextStyle(
                color: colorStyleSeventh,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 11),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Silahkan Masukkan kode verifikasi yang telah kamu terima.',
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 112),
            FractionallySizedBox(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        preFilledWidget: const Text(
                          '-',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),
                        ),
                        length: 5,
                        controller: pinController,
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: pinTheme,
                        validator: (value) {
                          return value == '22222' || value == '12345'
                              ? null
                              : 'Opss! Kode Verifikasi yang kamu masukkan salah.';
                        },
                        errorBuilder: (context, error) {
                          return error.isNotEmpty
                              ? Container(
                                  height: 47,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: blackColor.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(top: 16),
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 8),
                                      Image.asset(
                                        'assets/images/warning.png',
                                        height: 17,
                                        width: 17,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        'Opss! Kode Verifikasi yang kamu masukkan salah.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: dangerFifth,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 47,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: blackColor.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(top: 16),
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 8),
                                      Image.asset(
                                        'assets/images/warning.png',
                                        height: 17,
                                        width: 17,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        'Kode harus diisi.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: dangerFifth,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        focusedPinTheme: pinTheme.copyWith(
                          decoration: pinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: pinTheme.copyBorderWith(
                          border: Border.all(color: dangerThird),
                        ),
                      ),
                    ),
                    const SizedBox(height: 57),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          focusNode.unfocus();
                          formKey.currentState!.validate();
                          pinController.clear();
                        },
                        style: ButtonStyle(
                          fixedSize: const MaterialStatePropertyAll(
                            Size(393, 56),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(colorStyleFifth),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        child: const Text('Kirim'),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Saya tidak menerima kode! '),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Kirim ulang',
                            style: TextStyle(color: colorStyleSeventh),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
