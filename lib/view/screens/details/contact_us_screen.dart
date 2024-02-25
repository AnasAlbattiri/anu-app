import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';

class ContactUs extends StatelessWidget {
   ContactUs({super.key});
  final Uri watsAppAnas = Uri.parse('https://wa.me/+962780548255');
  final Uri watsAppOsama = Uri.parse('https://wa.me/+962770706815');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      body:  ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    IconButton(
                      onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),),
                  ],
                ),
                const SizedBox(height: 40),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    textAlign: TextAlign.right,
                    'تواصل مع المطور',
                    style: TextStyle(
                      fontFamily: 'DGNemr',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration:  const BoxDecoration(
                  color:  wColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 180.0),
                  Container(
                    width:double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
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
                        const SizedBox(width: 15.0,),

                        IconButton(
                            onPressed: () {
                              launchUrl(watsAppAnas);
                            },
                            icon:  Image.asset('assets/images/whatsapp.png'),
                        ),
                        const Spacer(),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'انس البتيري',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'DGNemr',
                                color: wColor,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'هندسة برمجيات',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
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
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/developers/anas.jpg'),
                          ),
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    width:double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
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
                        const SizedBox(width: 15.0,),
                        IconButton(
                            onPressed: () {
                              launchUrl(watsAppOsama);
                            },
                            icon: Image.asset('assets/images/whatsapp.png'),
                        ),
                        const Spacer(),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'اسامة عميرة',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontFamily: 'DGNemr',
                                color: wColor,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'علم حاسوب',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
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
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/developers/osama.jpg'),
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
