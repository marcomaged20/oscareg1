// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/auth_controller.dart';
import 'package:oscareg/utils/my_string.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/screens/auth/auth_button.dart';
import 'package:oscareg/view/widgets/auth/auth_text_from_field.dart';

class ForgetPassworedScreen extends StatelessWidget {
  ForgetPassworedScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final TextEditingController Emailcontroller = TextEditingController();

  final Controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "forgot password",
            style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "if you want to recover your account,then please provide your email ID below..., ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/forgetpass copy.png",
                    width: 250,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextFromField(
                    controller: Emailcontroller,
                    obscureText: false,
                    validator: (Value) {
                      if (!RegExp(validationEmail).hasMatch(Value)) {
                        return " InValid Email";
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Image.asset("assets/images/email.png")
                        : const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          ),
                    suffixIcon: const Text(""),
                    hintText: "Email ",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            String email = Emailcontroller.text.trim();
                            Controller.resePassword(email);
                          }
                        },
                        text: "SEND");
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
