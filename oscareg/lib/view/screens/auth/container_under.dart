import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder(
      {required this.text,
      required this.onPressed,
      required this.textType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontsize: 20,
              fontWeight: FontWeight.bold,
              underline: TextDecoration.none,
              color: Colors.white,
              text: text),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                fontsize: 20,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
                color: Colors.white,
                text: textType),
          ),
        ],
      ),
    );
  }
}
