import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String text1;
  final String text2;

  const BottomText({
    Key? key,
    this.text1 = "Got an account?",
    this.text2 = "Sign in",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        TextButton(
          child: Text(text2, style: const TextStyle(color: Colors.black)),
          onPressed: () {
            print("Account Has been Created");
          },
        ),
      ],
    );
  }
}
