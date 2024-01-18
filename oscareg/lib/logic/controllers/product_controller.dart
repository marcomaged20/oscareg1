import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oscareg/model/product_models.dart';
import 'package:oscareg/services/product_services.dart';

class ProductController extends GetxController {
  var productlist = <ProductModels>[].obs;
  var FavoritesList = <ProductModels>[].obs;
  var isloading = true.obs;
  var stoarge = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = stoarge.read<List>("FavoritesList");
    if (storedShoppings != null) {
      FavoritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getproduct();
    try {
      isloading(true);
      if (products.isNotEmpty) {
        productlist.addAll(products);
      }
    } finally {
      isloading(false);
    }
  }

//  logic for favorites screen
  void Managefavorites(int productId) async {
    var existingInex =
        FavoritesList.indexWhere((element) => element.id == productId);
    if (existingInex >= 0) {
      FavoritesList.removeAt(existingInex);
      await stoarge.remove("FavoritesList");
    } else {
      FavoritesList.add(
          productlist.firstWhere((element) => element.id == productId));
      await stoarge.write("FavoritesList", FavoritesList);
    }
  }

  bool isFavorites(int productId) {
    return FavoritesList.any((element) => element.id == productId);
  }
}
