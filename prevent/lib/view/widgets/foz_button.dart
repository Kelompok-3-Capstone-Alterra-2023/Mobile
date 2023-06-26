import 'package:flutter/material.dart';

class FozButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color buttonColor;
  final Widget child;
  final void Function()? onPressed;
  const FozButton({
    super.key,
    required this.buttonColor,
    required this.child,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
