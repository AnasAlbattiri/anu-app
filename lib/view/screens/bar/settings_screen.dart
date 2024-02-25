import 'package:anu_app/view/screens/details/contact_us_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/constants.dart';
import '../on_boarding/on_boarding.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Uri recordWeb = Uri.parse('http://92.253.124.162/faces/ui/pages/guest/admissionOnline/index.xhtml;jsessionid=ad6719af5ebe35a3dd9c653102ca');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'الإعدادات',
          style: TextStyle(fontFamily: 'DGEnab', color: wColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    onPressed: () {
                      Get.off(()=> const OnBoardingScreen());
                    },
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'عن جامعة عجلون الوطنية',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DGNemr',
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        'نبذة عن الجامعة',
                        style: TextStyle(
                            fontFamily: 'DGNemr',
                            fontSize: 10.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  const Icon(
                    Icons.info_outline,
                    size: 30.0,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    onPressed: () {
                      Get.to(()=> ContactUs());
                    },
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'تواصل مع المطور',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DGNemr',
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        'للملاحظات والإقتراحات',
                        style: TextStyle(
                            fontFamily: 'DGNemr',
                            fontSize: 10.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  const Icon(
                    Icons.email_outlined,
                    size: 30.0,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    onPressed: () {
                      launchUrl(recordWeb);
                    },
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'تقديم طلب التحاق الكتروني',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DGNemr',
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        'للتقديم الكتروناً',
                        style: TextStyle(
                            fontFamily: 'DGNemr',
                            fontSize: 10.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  const Icon(
                    Icons.request_page_outlined,
                    size: 30.0,
                  ),

                ],
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}
