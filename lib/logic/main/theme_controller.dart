import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {

  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkMode';
  saveThemeData(bool isDark){
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromBox(){
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get getThemeData =>getThemeDataFromBox()
      ? ThemeMode.dark
      : ThemeMode.light;

  void changeTheme(){
    Get.changeThemeMode(
        getThemeDataFromBox()
            ? ThemeMode.light
            : ThemeMode.dark
    );
    saveThemeData(!getThemeDataFromBox());
  }
}