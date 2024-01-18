// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/widgets/home/card_items.dart';
import 'package:oscareg/view/widgets/home/search_text_form.dart';
import 'package:oscareg/view/widgets/text_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontsize: 25,
                        fontWeight: FontWeight.bold,
                        underline: TextDecoration.none,
                        color: Colors.white,
                        text: "Find you"),
                    SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                        fontsize: 28,
                        fontWeight: FontWeight.bold,
                        underline: TextDecoration.none,
                        color: Colors.white,
                        text: "INSPIRATION"),
                    SizedBox(
                      height: 20,
                    ),
                    searchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                    underline: TextDecoration.none,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    text: "categories"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
