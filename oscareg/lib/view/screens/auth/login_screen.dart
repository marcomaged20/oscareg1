// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/auth_controller.dart';
import 'package:oscareg/routes/routes.dart';
import 'package:oscareg/utils/my_string.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/screens/auth/auth_button.dart';
import 'package:oscareg/view/screens/auth/container_under.dart';
import 'package:oscareg/view/widgets/auth/auth_text_from_field.dart';
import 'package:oscareg/view/widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final fromkey = GlobalKey<FormState>();

  final TextEditingController Emailcontroller = TextEditingController();

  final TextEditingController Passwordcontroller = TextEditingController();

  final Controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: fromkey,
            child: Column(
              children: [
                SizedBox(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                fontsize: 28,
                                fontWeight: FontWeight.w500,
                                underline: TextDecoration.none,
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                text: "LOG"),
                            const SizedBox(width: 3),
                            TextUtils(
                                fontsize: 28,
                                fontWeight: FontWeight.w500,
                                underline: TextDecoration.none,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                text: "IN"),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 20,
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
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: Passwordcontroller,
                              obscureText:
                                  Controller.isVisibilty ? false : true,
                              validator: (Value) {
                                if (Value.toString().length < 6) {
                                  return "PassWord Should be longer or equal to 6 characters";
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Image.asset("assets/images/lock.png")
                                  : const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  Controller.Visibilty();
                                },
                                icon: Controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              hintText: "Password ",
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ForgetPassworedScreen);
                            },
                            child: TextUtils(
                              text: "forgot password ?",
                              fontsize: 14,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underline: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (fromkey.currentState!.validate()) {
                                String email = Emailcontroller.text.trim();
                                String password = Passwordcontroller.text;
                                Controller.LogInsingFirbase(
                                    email: email, password: password);
                              }
                            },
                            text: "LOGN IN",
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextUtils(
                          text: "OR?",
                          fontsize: 18,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underline: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                  onTap: () {
                                    Controller.GoogleSinAppsing();
                                  },
                                  child:
                                      Image.asset("assets/images/google.png"));
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ContainerUnder(
                  text: "Don't have an Account? ",
                  textType: "Sgin Up",
                  onPressed: () {
                    Get.offNamed(Routes.SignUpScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
