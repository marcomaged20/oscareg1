import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/main_controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
