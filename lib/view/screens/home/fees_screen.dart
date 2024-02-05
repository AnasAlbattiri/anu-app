import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  bool isLoading = true;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  void loadFile() async {
    pdfViewerKey.currentState?.openBookmarkView();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('PDF',style: TextStyle(
            fontFamily: 'DGEnab',
          ),),

          backgroundColor: primaryColor,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : SfPdfViewer.asset(
                'assets/PDF/feesPdf.pdf',
                key: pdfViewerKey,
                enableDoubleTapZooming: true,
              ),
      ),
    );
  }
}
