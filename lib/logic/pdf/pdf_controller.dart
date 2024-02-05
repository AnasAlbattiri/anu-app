import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfController extends GetxController{
  bool isLoading = true;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  void loadFile() async {
    pdfViewerKey.currentState?.openBookmarkView();
      isLoading = false;
  }

@override
  void onInit() {
    super.onInit();
    loadFile();
  }



}