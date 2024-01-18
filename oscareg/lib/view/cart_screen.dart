// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/cart_controller.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/widgets/cart/cart_product_card.dart';
import 'package:oscareg/view/widgets/cart/cart_total.dart';
import 'package:oscareg/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartConrtoller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.clearAllproducts();
                },
                icon: const Icon(Icons.backspace))
          ],
        ),
        body: Obx(
          () {
            if (controller.ProductMap.isEmpty) {
              return const EmpatyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CarProductCart(
                              index: index,
                              productModels:
                                  controller.ProductMap.keys.toList()[index],
                              quantity:
                                  controller.ProductMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: controller.ProductMap.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
