import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Calender', style: TextStyle(fontFamily: 'Circular', color: wColor),),
      ),
    );
  }
}
