import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/constants.dart';
class ELearningScreen extends StatelessWidget {
   ELearningScreen({super.key});

  final Uri teamsUrl = Uri.parse('https://play.google.com/store/apps/details?id=com.microsoft.teams&hl=en_US');
   final Uri moodleUrl = Uri.parse('https://moodle.kts-jordan.com/');
   final Uri infoTeams = Uri.parse('https://www.youtube.com/watch?v=ISqvvU-AFMc');
   final Uri infoMoodle = Uri.parse('https://web.facebook.com/alqudahtamer/videos/873931417466446/?idorvanity=253290291738757');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('التعليم الاكتروني' , style: TextStyle(
          fontFamily: 'DGEnab',
          fontSize: 16.0,
        ),),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration:  BoxDecoration(
                  color: Get.isDarkMode ? bColor : wColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                  )),
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
                      'تيمز', 'assets/images/teams.jpg', () => launchUrl(teamsUrl),context),

                    itemDashboard(
                      'موديل', 'assets/images/moodle.jpg', () => launchUrl(moodleUrl),context),

                    itemDashboard(
                        'كيفية استخدام تيمز', 'assets/images/howto.jpg', ()=> launchUrl(infoTeams),context),
                    itemDashboard(
                        'كيفية استخدام موديل', 'assets/images/infoto.jpg', ()=> launchUrl(infoMoodle),context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  itemDashboard(String title, String imageData, Function() onPressed,BuildContext context) =>
      InkWell(
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
            child: Image.asset(imageData,scale: 0.5,),
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
