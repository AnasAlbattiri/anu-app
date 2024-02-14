import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../details/pdf_screen.dart';

class RecordScreen extends StatelessWidget {
   RecordScreen({super.key});
  final Uri anuUrl = Uri.parse('https://www.anu.edu.jo/');
  final Uri studentServices = Uri.parse('http://92.253.124.162/');
  final Uri studentSchedule = Uri.parse('http://92.253.124.162/student/schedule');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Get.isDarkMode ? bColor :  wColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text('التسجيل',style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'DGEnab',
        ),),
      ),
      body: Stack(
        children: [
          Container(
        color: primaryColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration:  BoxDecoration(
              color: Get.isDarkMode ? bColor :  wColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(200),
              )
          ),
        ),
      ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
                children: [
                  const SizedBox(height: 160.0,),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 50,
                    children: [
                      itemDashboard(
                        'الجدول الدراسي', 'assets/images/schedule.jpg', () => launchUrl(studentSchedule),context,
                      ),
                      itemDashboard(
                        'التخصصات والرسوم', 'assets/images/fees.jpg', () => Get.to(PdfScreen(path:'assets/PDF/feesPdf.pdf' ,title: 'التخصصات والرسوم',)),context,
                      ),
                      itemDashboard(
                        'موقع التسجيل', 'assets/images/anu.jpg', ()=> launchUrl(anuUrl),context),
                      itemDashboard(
                          'خدمات الطالب', 'assets/images/services.jpg', ()=> launchUrl(studentServices),context),
                    ],
                  ),
                ],
              ),
          ),
        ],
      ),

    );
  }

  itemDashboard(String title, String imageData, Function() onPressed,BuildContext context) => InkWell(
   onTap: onPressed,
    enableFeedback: true,
    child: Column(
      children: [
        Expanded(
          child: Container(
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
            child: Image.asset(imageData),
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
