import 'package:anu_app/view/screens/home/colage_doctors/educationalScience_doctor_screen.dart';
import 'package:anu_app/view/screens/home/colage_doctors/engineering_doctors_screen.dart';
import 'package:anu_app/view/screens/home/colage_doctors/it_doctors_screen.dart';
import 'package:anu_app/view/screens/home/colage_doctors/literature_doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import 'colage_doctors/agriculture_doctor_screen.dart';
import 'colage_doctors/law_doctors_screen.dart';
import 'colage_doctors/science_doctors_screen.dart';
import 'colage_doctors/work_doctors_screen.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الدكاترة' , style: TextStyle(
          fontFamily: 'DGEnab',
          fontSize: 16.0,
        ),),
        backgroundColor: primaryColor,
      ),
      body:  Stack(
        children: [
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration:  BoxDecoration(
                  color: Get.isDarkMode ? bColor : wColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(200),
                  )),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const SizedBox(height: 40.0,),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                    children: [
                      itemDashboard(
                          'كلية تكنلوجيا المعلومات', 'assets/images/itCollage.jpg', () => Get.to(() => ItDoctorsScreen()),context),

                      itemDashboard(
                          'كلية الآداب', 'assets/images/AnuDoctors.jpg', () => Get.to(() => LiteratureDoctorsScreen()),context),
                      itemDashboard(
                          'كلية القانون', 'assets/images/Law/lawcolage.jpg', () => Get.to(() => LawDoctorsScreen()),context),
                      itemDashboard(
                          'كلية الاعمال', 'assets/images/works/colageofwork.jpg', () => Get.to(() => WorksDoctorsScreen()),context),
                      itemDashboard(
                          'كلية الهندسة', 'assets/images/Engineering/CollegeofEngineering.jpg', () => Get.to(() => EngineeringDoctorsScreen()),context),
                      itemDashboard(
                          'كلية العلوم', 'assets/images/Science/science.jpg', () => Get.to(() => ScienceDoctorsScreen()),context),
                      itemDashboard(
                          'كلية العلوم التربوية', 'assets/images/Educational Sciences/EducationalSciences.jpg', () => Get.to(() => EducationalScienceDoctorsScreen()),context),
                      itemDashboard(
                          'كلية الزراعة', 'assets/images/Agriculture/Agriculture.jpg', () => Get.to(() => AgricultureDoctorsScreen()),context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
  itemDashboard(String title, String imageData, Function() onPressed , BuildContext context) => InkWell(
    onTap: onPressed,
    enableFeedback: true,
    child: Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5
                ),
              ],
            ),
            child: Image.asset(imageData,),
          ),
        ),
        const SizedBox(height: 15.0,),
        Text(title,style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'DGNemr',
          fontSize: 12.0,
        ),
        ),
      ],
    ),
  );
}
