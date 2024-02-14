import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'الأسئلة الأكثر شيوعاً',
          style: TextStyle(
            fontSize: 16.0,
          fontFamily: 'DGEnab',
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration:  BoxDecoration(
                color: Get.isDarkMode ? bColor : wColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(200),
                ),
              ),
            ),
          ),

          //TODO: ExpansionPanelList
        ],
      ),
    );
  }
}

