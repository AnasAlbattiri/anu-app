import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';



class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({Key? key, required this.softwareDocsModel}) : super(key: key);
  final dynamic softwareDocsModel;

  @override
  Widget build(BuildContext context) {
    final Uri whatsNumber = Uri.parse('https://wa.me/${softwareDocsModel.phone}');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(softwareDocsModel.image),
                        fit: BoxFit.cover,
                      ),
                      color: primaryColor,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(.3)
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              softwareDocsModel.title,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DGNemr',
                                  fontSize: 36),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          "نبذة عن الدكتور",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'DGNemr',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          softwareDocsModel.about,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "التخصص",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'DGNemr',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          softwareDocsModel.education,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "البريد الإلكتروني",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'DGNemr',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          softwareDocsModel.email,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 50),
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: const Text(
                                  'عودة',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'DGNemr'),
                                )),
                            const SizedBox(
                              width: 14,
                            ),

                            ElevatedButton(
                                onPressed: () async {
                                  launchUrl(whatsNumber);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 50),
                                  backgroundColor: wColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child:  Row(
                                  children: [
                                    Image.asset('assets/images/whatsapp.jpg',height: 25,),
                                    const SizedBox(width: 5.0,),
                                    const Text(
                                      'واتس اب',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'DGNemr'),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
