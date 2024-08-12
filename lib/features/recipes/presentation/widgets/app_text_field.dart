import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
          ),
        ),
        child: TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Color(0xFF165932),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF165932)),
            ),
          ),
        ),
      );
}
