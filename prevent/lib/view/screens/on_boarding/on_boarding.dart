import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/login/login_screen.dart';

import '../../../util/common.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      bodyPadding: EdgeInsets.all(16.0),
    );

    return IntroductionScreen(
      globalBackgroundColor: colorStyleSecond,
      pages: [
        // Screen 1
        PageViewModel(
          titleWidget: Text(
            AppLocalizations.of(context)!.onBoardingOneTitle,
            // 'Psikolog Terbaik',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: bold,
              color: colorStyleSixth,
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: Text(
            AppLocalizations.of(context)!.onBoardingOneSubTitle,
            // 'Kamu gak harus selesein semua masalahmu sendirian kok! Temukan psikolog terbaik di prevent yang siap bantu kamu kapanpun.',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: reguler,
              color: blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          image: Image.asset(
            'assets/images/on_boarding_one.png',
            width: 350,
          ),
          decoration: pageDecoration.copyWith(
            imageFlex: 10,
            bodyFlex: 10,
            safeArea: 0,
            contentMargin: const EdgeInsets.all(25),
          ),
        ),

        // Screen 2
        PageViewModel(
          titleWidget: Text(
            AppLocalizations.of(context)!.onBoardingTwoTitle,
            // 'Update Artikel',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: bold,
              color: colorStyleSixth,
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: Text(
            AppLocalizations.of(context)!.onBoardingTwoSubTitle,
            // 'Bingung mau baca informasi kesehatan mental dimana? Tenang! Prevent selalu update artikel terbaru agar kamu selalu terinformasi dimanapun!.',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: reguler,
              color: blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          image: Image.asset(
            'assets/images/on_boarding_two.png',
            width: 350,
            height: 250,
          ),
          decoration: pageDecoration.copyWith(
            imageFlex: 10,
            bodyFlex: 10,
            safeArea: 0,
            contentMargin: const EdgeInsets.all(25),
          ),
        ),

        // Screen 3
        PageViewModel(
          titleWidget: Text(
            AppLocalizations.of(context)!.onBoardingThreeTitle,
            // 'Manfaatnya Terbukti',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: bold,
              color: colorStyleSixth,
            ),
            textAlign: TextAlign.center,
          ),
          bodyWidget: Text(
            AppLocalizations.of(context)!.onBoardingThreeSubTitle,
            // 'Banyak pengguna yang telah berhasil melalui masa sulitnya bareng prevent!.',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: reguler,
              color: blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          image: Image.asset(
            'assets/images/on_boarding_three.png',
            width: 350,
            height: 290,
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 10,
            footerFlex: 4,
            safeArea: 0,
            contentMargin: const EdgeInsets.all(25),
          ),
          footer: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                style: TextButton.styleFrom(
                  side: BorderSide(
                    color: colorStyleFifth,
                    width: 2.0,
                  ),
                  backgroundColor: colorStyleFifth,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.btnTutup,
                  // 'Tutup',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: reguler,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: false,
      showBackButton: false,
      back: const Icon(Icons.arrow_back),
      skip: Image.asset('assets/images/skip_button.png'),
      next: Image.asset('assets/images/next_button.png'),
      dotsDecorator: DotsDecorator(
        size: const Size(10, 10),
        color: greyColor,
        activeColor: successThird,
        activeSize: const Size(20, 10),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
