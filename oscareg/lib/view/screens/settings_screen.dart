import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/auth_controller.dart';
import 'package:oscareg/logic/controllers/theme_controller.dart';
import 'package:oscareg/utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().ChangesTheme();
              },
              child: Text(
                "Dark Mode",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(
              builder: (contrller) {
                return TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Logout from App ",
                        titleStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        middleText: " Are you sure you need logout",
                        middleTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.grey,
                        radius: 10,
                        textCancel: "NO",
                        cancelTextColor: Colors.white,
                        textConfirm: "yes",
                        confirmTextColor: Colors.white,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {
                          contrller.SginOutFromApp();
                        },
                        buttonColor: Get.isDarkMode ? pinkClr : mainColor);

                    // contrller.SginOutFromApp();
                  },
                  child: Text(
                    "LogOut",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
