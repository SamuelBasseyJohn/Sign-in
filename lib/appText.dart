import 'package:flutter/material.dart';

class appText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color? textColor;
  const appText(
      {Key? key,
      this.fontSize = 12,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
