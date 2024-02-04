// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../../utils/constants.dart';
//
// class BottomContainer extends StatelessWidget {
//   const BottomContainer(
//       {Key? key,
//         required this.text,
//         required this.onPressed,
//         required this.textType})
//       : super(key: key);
//
//   final String text;
//   final String textType;
//   final Function() onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 100,
//       decoration: BoxDecoration(
//         color: primaryColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(text, style: TextStyle(
//             fontFamily: 'Circular',
//             color: wColor,
//             fontSize: 14,
//           ),),
//           TextButton(
//               onPressed: onPressed,
//               child: Text(
//                 textType,
//                 style: TextStyle(
//                   fontSize: 18,
//                   height: 1.5,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   decoration: TextDecoration.underline,
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
