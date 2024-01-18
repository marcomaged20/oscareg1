import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontsize: 18,
        fontWeight: FontWeight.bold,
        underline: TextDecoration.none,
      ),
    );
  }
}
