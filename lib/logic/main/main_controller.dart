import 'dart:io';

import 'package:anu_app/view/screens/bar/calender_screen.dart';
import 'package:anu_app/view/screens/bar/profile_screen.dart';
import 'package:get/get.dart';
import '../../view/screens/bar/home_screen.dart';
import '../../view/screens/bar/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeScreen(int index) {
    currentIndex.value = index;
  }

  final screens = [
    HomeScreen(),
    CalenderScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ].obs;

}
