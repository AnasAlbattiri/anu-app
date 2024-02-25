import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../widgets/faq_list_widget.dart';

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
      body: expendableList(),
    );
  }
}

