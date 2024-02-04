import 'package:get/get.dart';
import '../../view/screens/bar/calender_screen.dart';
import '../../view/screens/bar/home_screen.dart';
import '../../view/screens/bar/notification_screen.dart';
import '../../view/screens/bar/profile_screen.dart';
import '../../view/screens/bar/search_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeScreen(int index) {
    currentIndex.value = index;
  }


  final screens = [
    HomeScreen(),
    SearchScreen(),
    CalenderScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ].obs;

}