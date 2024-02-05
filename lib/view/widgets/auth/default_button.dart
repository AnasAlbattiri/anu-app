import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';


class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor:Get.isDarkMode ?  bColor: wColor,
      minimumSize: const Size(360, 50),
    ),
        child:  Text(
             text,
          style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
    );
  }
}
