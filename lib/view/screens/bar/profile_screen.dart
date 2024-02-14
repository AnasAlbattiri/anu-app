import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Profile',
          style: TextStyle(fontFamily: 'Circular', color: wColor),
        ),
      ),
    );
  }
}
