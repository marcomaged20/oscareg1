// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/model/product_models.dart';
import 'package:oscareg/routes/routes.dart';
import 'package:oscareg/utils/theme.dart';

class CartConrtoller extends GetxController {
  var ProductMap = {}.obs;

  void addProducttocart(ProductModels ProductModels) {
    if (ProductMap.containsKey(ProductModels)) {
      ProductMap[ProductModels] += 1;
    } else {
      ProductMap[ProductModels] = 1;
    }
  }

  void removeProductfromcart(ProductModels productModels) {
    if (ProductMap.containsKey(ProductModels) &&
        ProductMap[ProductModels] == 1) {
      ProductMap.removeWhere((key, value) => key == ProductModels);
    } else {
      ProductMap[ProductMap] -= 1;
    }
  }

  void removeOneproduct(ProductModels productModels) {
    ProductMap.removeWhere((key, value) => key == ProductModels);
  }

  void clearAllproducts() {
    Get.defaultDialog(
        title: "Clean products ",
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
          Get.toNamed(Routes.CartScreen);
        },
        onConfirm: () {
          ProductMap.clear();
          Get.back();
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
  }

  get productSubTotal =>
      print(ProductMap.entries.map((e) => e.key.price * e.value).toList());
  get total => ProductMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
