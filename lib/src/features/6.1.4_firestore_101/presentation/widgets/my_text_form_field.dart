import 'package:flutter/material.dart';
import 'package:kapital_5/src/theme/palette.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final String helperText;

  const MyTextFormField({
    super.key,
    required this.userInput,
    required this.hintText, required this.helperText,
  });

  final TextEditingController userInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: userInput,
      style: TextStyle(color: Palette.basicBitchBlack),
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.basicBitchWhite,
        hintText: hintText,
        helperText: helperText,
        contentPadding: EdgeInsets.only(bottom: 14),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.basicBitchBlack,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintStyle: TextStyle(
          color: Palette.basicBitchBlack,
          fontFamily: 'Inter',
          fontSize: 12,
        ),
      ),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
