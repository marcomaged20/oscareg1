import 'package:get/get.dart';
import 'package:oscareg/view/screens/category_screen.dart';
import 'package:oscareg/view/screens/favorites_screen.dart';
import 'package:oscareg/view/screens/home_screen.dart';
import 'package:oscareg/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentindex = 0.obs;
  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoritesScreen(),
    const SettingsScreen(),
  ].obs;

  final Title = [
    "Oscareg Shop",
    "Categories",
    "Favorites",
    " Settings",
  ].obs;
}
