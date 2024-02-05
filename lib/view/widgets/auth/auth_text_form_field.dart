import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';


class AuthTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final bool isPassword;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextAlign textAlign ;
  final TextInputType? textInputType;
  final InputBorder? enabledBorderStyle;
  final InputBorder? focusedBorderStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final void Function()? suffixPressed;
  final String hint;
  final bool isClickable = true;
  final Widget? prefix;
  final Widget? suffix;
  final dynamic validate;
  const AuthTextFormField({
    super.key,
     this.controller,
    this.decoration,
    required this.isPassword,
    this.suffixIconColor,
    this.prefixIconColor,
    this.enabledBorderStyle,
    this.focusedBorderStyle,
    this.style,
    this.onChange,
    this.onTap,
    this.suffixPressed,
    this.prefix,
    this.suffix,
    this.validate,
    required this.hint,
    this.hintStyle,
    this.textInputType,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      style: const TextStyle(
        color: bColor,
      ),
      validator: validate,
      controller: controller,
      obscureText: isPassword,
      cursorColor: Colors.black,

      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIconColor: suffixIconColor,
        prefixIconColor: prefixIconColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
        errorBorder:   OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: hintStyle,
        filled: true,
        fillColor: Get.isDarkMode ? Colors.grey[400] :Colors.grey[200],
        border: const OutlineInputBorder(),
      ),
    );
  }
}
