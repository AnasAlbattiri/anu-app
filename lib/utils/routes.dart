import 'package:anu_app/view/screens/bar/home_screen.dart';
import 'package:anu_app/view/screens/on_boarding/on_boarding.dart';
import 'package:get/get.dart';
import '../view/screens/main/main_screen.dart';
import '../view/screens/main/splash_screen.dart';

class AppRoutes {

  static const splash = '/splash';
  static const main = '/main';
  static const home = '/home';
  static const onBoard = '/onBoard';


  static final routes = [
    GetPage(
      name: '/main',
      page: () => MainScreen(),
    ),
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/onBoard',
      page: () => OnBoardingScreen(),

    ),
  ];
}