import 'package:flutter/material.dart';
import 'package:my_flutter_assignment/Widgets/constant.dart';

class AppText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color? textColor;
  final FontWeight fontWeight;
  const AppText({
    Key? key,
    this.fontSize = 18,
    required this.text,
    this.textColor = textColour,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: "Inter-Bold"),
    );
  }
}
