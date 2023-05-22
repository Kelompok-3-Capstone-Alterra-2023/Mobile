import 'package:flutter/material.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

bool obscureNew = true;
bool obscureConfirm = true;

class _ResetPassScreenState extends State<ResetPassScreen> {
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
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: TextFormField(
              obscureText: obscureNew,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      obscureNew ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscureNew = !obscureNew;
                    });
                  },
                ),
                labelText: 'New Password',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: TextFormField(
              obscureText: obscureConfirm,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      obscureConfirm ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscureConfirm = !obscureConfirm;
                    });
                  },
                ),
                labelText: 'Confirm Password',
                border: const OutlineInputBorder(),
              ),
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
              onPressed: () {},
              child: const Text(
                'Kirim',
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
