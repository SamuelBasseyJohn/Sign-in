import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  final TextEditingController _firstAndMiddleName;
  final String hintText;
  final String? Function(String?)? validator;

  const FormFields({
    Key? key,
    required TextEditingController firstAndMiddleName,
    required this.hintText,
    required this.validator,
  })  : _firstAndMiddleName = firstAndMiddleName,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: _firstAndMiddleName,
      decoration: const InputDecoration(
        hintText: "Full legal first and middle name(s)",
        border: OutlineInputBorder(),
      ),
    );
  }
}
