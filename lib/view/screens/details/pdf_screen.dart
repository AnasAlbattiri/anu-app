import 'package:anu_app/logic/pdf/pdf_controller.dart';
import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
   PdfScreen({super.key, required this.path, required this.title,});
 final String path;
 final String title;
 final controller = Get.put(PdfController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfController>(

      builder:(controller)=> SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(title,style: const TextStyle(
              fontFamily: 'DGEnab',
            ),),

            backgroundColor: primaryColor,
          ),
          body: controller.isLoading
              ? const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          )
              : SfPdfViewer.asset(
            path,
            key: controller.pdfViewerKey,
            enableDoubleTapZooming: true,
          ),
        ),
      ),
    );
  }

}


