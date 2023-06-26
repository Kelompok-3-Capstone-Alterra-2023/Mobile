import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse('https://main--starlit-lokum-26b84a.netlify.app/help'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        backgroundColor: whiteColor,
        leading: IconButton(
            splashRadius: 18,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: blackColor,
            )),
        elevation: 0,
        title: Text(
          'Bantuan',
          style: GoogleFonts.inter(
              color: blackColor, fontWeight: semiBold, fontSize: 16),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
