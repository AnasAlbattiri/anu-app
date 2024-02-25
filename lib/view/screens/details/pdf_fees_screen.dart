import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';


class PdfScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('التخصصات والرسوم',style: TextStyle(
                fontFamily: 'DGEnab',
              ),),

              backgroundColor: primaryColor,
            ),
            body: const PDF(enableSwipe: true,).fromAsset('assets/PDF/feesPdf.pdf'),
          ),
        ),
      );

  }

}


