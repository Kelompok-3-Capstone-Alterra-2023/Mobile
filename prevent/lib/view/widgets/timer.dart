import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/view/screens/home/home_screen.dart';

class TimerExample extends StatefulWidget {
  final int start;

  const TimerExample({super.key, required this.start});

  @override
  _TimerExampleState createState() => _TimerExampleState();
}

class _TimerExampleState extends State<TimerExample> {
  late Timer _timer;
  late int _start;

  @override
  void initState() {
    super.initState();
    _start = widget.start;
    startTimer();
  }

  String getTimerText() {
    int hours = _start ~/ 3600;
    int minutes = (_start % 3600) ~/ 60;
    int seconds = _start % 60;

    String hoursText = hours.toString().padLeft(2, '0');
    String minutesText = minutes.toString().padLeft(2, '0');
    String secondsText = seconds.toString().padLeft(2, '0');

    return '$hoursText:$minutesText:$secondsText';
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getTimerText(),
      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
