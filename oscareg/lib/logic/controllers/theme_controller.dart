import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final Key = "isDarkModes";
  saveThemeDataInbox(bool isDark) {
    boxStorage.write(Key, isDark);
  }

  bool getThemeDatafromBox() {
    return boxStorage.read<bool>(Key) ?? false;
  }

  ThemeMode get ThemeDataGet =>
      getThemeDatafromBox() ? ThemeMode.dark : ThemeMode.light;

  void ChangesTheme() {
    Get.changeThemeMode(
        getThemeDatafromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInbox(!getThemeDatafromBox());
  }
}
