// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/cart_controller.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/widgets/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});
  final controller = Get.find<CartConrtoller>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextUtils(
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                      underline: TextDecoration.none,
                      color: Colors.grey,
                      text: "Total"),
                  Text(
                    "\$ ${controller.total}",
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.shopping_cart),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
