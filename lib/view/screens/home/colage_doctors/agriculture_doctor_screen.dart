import 'package:anu_app/data/model/collage_of_agriculture.dart';
import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../details/doctor_details_screen.dart';

class AgricultureDoctorsScreen extends StatelessWidget {
  const AgricultureDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CollegeOfAgriculture> softDoc = softDocs;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'كلية الزراعة',
          style: TextStyle(fontFamily: 'DGEnab', color: wColor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final softDoc = softDocs[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 5,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => DoctorDetailsScreen(
                            softwareDocsModel: softDoc));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        softDoc.title,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontFamily: 'DGNemr',
                          color: wColor,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        softDoc.education,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontFamily: 'DGNemr',
                          color: wColor,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(softDoc.image),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: softDoc.length,
      ),

    );
  }
}
