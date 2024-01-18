import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/routes/routes.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        fontsize: 35,
                        fontWeight: FontWeight.bold,
                        text: "Oscareg",
                        color: Color.fromARGB(255, 166, 36, 36),
                        underline: TextDecoration.none,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      TextUtils(
                        fontsize: 35,
                        fontWeight: FontWeight.bold,
                        text: "Shop",
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      )),
                  onPressed: () {
                    Get.offNamed(Routes.LoginScreen);
                  },
                  child: const TextUtils(
                      fontsize: 22,
                      fontWeight: FontWeight.bold,
                      underline: TextDecoration.none,
                      color: Colors.white,
                      text: "Get Start"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                      fontsize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      text: "Don't have an Account ? ",
                      underline: TextDecoration.none,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.SignUpScreen);
                        },
                        child: const TextUtils(
                          text: "sign up",
                          color: Colors.white,
                          fontsize: 18,
                          fontWeight: FontWeight.normal,
                          underline: TextDecoration.underline,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
