import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';

class CafeteriaScreen extends StatelessWidget {
  const CafeteriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor :  wColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الكافيتيريا' , style: TextStyle(
          fontFamily: 'DGEnab',
          fontSize: 16.0,
        ),),
        backgroundColor: primaryColor,
      ),

    );
  }
}
