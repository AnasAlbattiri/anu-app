import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../../../data/model/nav_item_model.dart';
import '../../../../utils/rive_utils.dart';
import '../../../logic/main/main_controller.dart';
import '../../../utils/constants.dart';
import '../../widgets/rive/bottom_nav_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

  // Variables
  final mainController = Get.put(MainController());
  List<String> screens = ["Home", "Search", "Calender", "Notification", "Profile"];
  bool isSideBarOpen = false;
  Menu selectedBottonNav = bottomNavItems.first;
  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;
  late SMIBool isMenuOpenInput;

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }


  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
            () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => IndexedStack(
          index: mainController.currentIndex.value,
          children: mainController.screens,
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10,),
            child: Container(
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    bottomNavItems.length,
                        (index) {
                      Menu navBar = bottomNavItems[index];
                      return BtmNavItem(
                        navBar: navBar,
                        press: () {
                          RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                          updateSelectedBtmNav(navBar);
                          mainController.changeScreen(index);
                        },
                        riveOnInit: (artboard) {
                          navBar.rive.status = RiveUtils.getRiveInput(artboard,
                              stateMachineName: navBar.rive.stateMachineName);
                        },
                        selectedNav: bottomNavItems[mainController.currentIndex.value],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
