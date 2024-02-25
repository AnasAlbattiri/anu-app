import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import '../../data/model/faq_model.dart';

Widget expendableList() {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: LocalData().nameList.length,
    itemBuilder: (context, i) {
      return Column(
        children: [
          ExpansionTile(
            shape: const RoundedRectangleBorder(),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                textAlign: TextAlign.end,
                LocalData().nameList[i].title,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DGNemr',
                  color: primaryColor,
                ),
              ),
            ),
            trailing: const Icon(
              Icons.info_outline,
              color: primaryColor,
            ),
            leading: const Icon(
              Icons.arrow_drop_down,
              color: primaryColor,
            ),
            children: [
              Column(
                children: [
                  ListTile(
                    subtitle: Text(
                      textAlign: TextAlign.end,
                      LocalData().nameList[i].body,
                      style: const TextStyle(
                        fontFamily: 'DGNemr',
                      ),
                    ),
                  ),
                  if (LocalData().nameList[i].sfPdfViewer != null)
                    Container(
                        width: double.infinity,
                        height: 500,
                        child: const PDF(enableSwipe: true, autoSpacing: false)
                            .fromAsset('assets/PDF/buss.pdf'),
                    ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}
