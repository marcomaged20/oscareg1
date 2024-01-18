import 'package:http/http.dart' as http;
import 'package:oscareg/model/product_models.dart';
import 'package:oscareg/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModels>> getproduct() async {
    var respons = await http.get(Uri.parse("$baseUrl/products"));
    if (respons.statusCode == 200) {
      var JsonData = respons.body;
      return productModelsFromJson(JsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
