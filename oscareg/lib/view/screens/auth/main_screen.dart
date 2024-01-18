import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oscareg/logic/controllers/main_controller.dart';
import 'package:oscareg/routes/routes.dart';
import 'package:oscareg/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final Controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.CartScreen);
              },
              icon: Image.asset("assets/images/shop.png"),
            ),
          ],
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          title: Text(Controller.Title[Controller.currentindex.value]),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          currentIndex: Controller.currentindex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.category,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: "",
            ),
          ],
          onTap: (index) {
            Controller.currentindex.value = index;
          },
        ),
        body: IndexedStack(
          index: Controller.currentindex.value,
          // ignore: invalid_use_of_protected_member
          children: Controller.tabs.value,
        ),
      );
    }));
  }
}
