import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/view/screens/home/home_screen.dart';

class AppTimer extends StatefulWidget {
  final int start;
  final double? size;
  final Color? fontColor;

  const AppTimer({super.key, required this.start, this.fontColor, this.size});


  @override
  _AppTimerState createState() => _AppTimerState();
}

class _AppTimerState extends State<AppTimer> {
  late Timer _timer;
  late int _start;
  late double? _size;
  late Color? _fontColor;


  @override
  void initState() {
    super.initState();
    _start = widget.start;
    _size = widget.size;
    _fontColor = widget.fontColor;
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
      style: GoogleFonts.poppins(
          fontSize: _size, fontWeight: FontWeight.bold, color: _fontColor),
    );
  }
}
