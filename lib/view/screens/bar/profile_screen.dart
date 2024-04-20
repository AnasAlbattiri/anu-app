import 'package:anu_app/utils/constants.dart';
import 'package:anu_app/view/screens/home/cafeteria_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../details/tasbeh_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70.0),
                          bottomRight: Radius.circular(70.0)),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: 75.0,
                      backgroundImage: AssetImage('assets/images/person.jpg',),
                      backgroundColor: wColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 50,
                    children: [
                      itemDashboard(
                          'المسبحة الإلكترونية',
                          'assets/images/pray.jpg',
                          () => Get.to(
                                ()=>   TasbehScreen(),
                            transition: Transition.fade,
                            duration: Duration(milliseconds: 400),
                              ),
                          context),
                      itemDashboard(
                          'الكافيتيريا',
                          'assets/images/cafeteria.jpg',
                          () => Get.to(
                              ()=> CafeteriaScreen(),
                            transition: Transition.fade,
                            duration: Duration(milliseconds: 400),
                              ),
                          context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemDashboard(String title, String imageData, Function() onPressed,
          BuildContext context) =>
      InkWell(
        onTap: onPressed,
        enableFeedback: true,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5),
                  ],
                ),
                child: Image.asset(imageData),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'DGNemr',
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      );
}
