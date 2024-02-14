import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/main/theme_controller.dart';
import '../../../utils/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            ThemeController().changeTheme();
          },
          icon: const Icon(
            Icons.dark_mode_outlined,
            color: Colors.white,
          ),
        ),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'قيم التطبيق',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DGNemr',
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        'ادعمنا بتقييمك',
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
                    Icons.star_border_outlined,
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
