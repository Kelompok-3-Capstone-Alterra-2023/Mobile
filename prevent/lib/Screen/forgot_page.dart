import 'package:flutter/material.dart';
import 'package:prevent/Screen/reset_page.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

final _emailController = TextEditingController();

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          Container(
            margin: const EdgeInsets.all(9),
            color: Colors.grey,
            height: MediaQuery.of(context).size.height / 2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin:
                const EdgeInsets.only(left: 43, right: 43, top: 15, bottom: 11),
            child: const Text(
              'Lupa Password?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 43, right: 43, bottom: 30),
            child: const Text(
              'Jagan khawatir, Silahkan masukkan alamat email yang kamu gunakan di akunmu ya!',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 50),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassScreen())),
              child: const Text(
                'Lanjut',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
