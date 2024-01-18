import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final TextDecoration underline;

  const TextUtils(
      {required this.fontsize,
      required this.fontWeight,
      required this.underline,
      required this.color,
      super.key,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
        decoration: underline,
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
      )),
    );
  }
}
