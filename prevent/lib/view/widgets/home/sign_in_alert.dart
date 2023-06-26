import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';
import 'package:prevent/view/screens/login/login_screen.dart';

class AlertLogin extends StatelessWidget {
  const AlertLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please Login First',
            style: GoogleFonts.poppins(
                fontWeight: bold, fontSize: 15, color: colorStyleFifth),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            child: const Text('Sign In'),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
