import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/cart_controller.dart';
import 'package:oscareg/logic/controllers/product_controller.dart';
import 'package:oscareg/model/product_models.dart';
import 'package:oscareg/utils/theme.dart';
import 'package:oscareg/view/widgets/text_utils.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});
  final clientController = Get.find<ProductController>();
  final controller = Get.find<CartConrtoller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (clientController.isloading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
            itemCount: clientController.productlist.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                image: clientController.productlist[index].image,
                price: clientController.productlist[index].price,
                rate: clientController.productlist[index].rating.rate,
                productId: clientController.productlist[index].id,
                ProductModels: clientController.productlist[index],
              );
            },
          ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels ProductModels,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      clientController.Managefavorites(productId);
                    },
                    icon: clientController.isFavorites(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProducttocart(ProductModels);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            fontsize: 13,
                            fontWeight: FontWeight.bold,
                            underline: TextDecoration.none,
                            color: Colors.white,
                            text: "$rate",
                          ),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
