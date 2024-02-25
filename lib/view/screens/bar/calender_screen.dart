import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class CalenderScreen extends StatefulWidget {

  const CalenderScreen({
    super.key,
  });

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'التقويم الجامعي',
            style: TextStyle(
              fontFamily: 'DGEnab',
            ),
          ),
          backgroundColor: primaryColor,
        ),
        body:  const PDF(enableSwipe: true,autoSpacing: false).fromAsset('assets/PDF/Calender.pdf'),
      ),
    );
  }
}
