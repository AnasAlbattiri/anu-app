import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import '../home/calculator_screen.dart';
import '../home/gpa_screen.dart';
import '../home/record_screen.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri facebookPage = Uri.parse('https://web.facebook.com/Ajloun.un');

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 75),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Student!', style: TextStyle(fontFamily: 'Circular', color: Colors.white, fontSize: 22),),
                  subtitle: Text('Good Morning', style: TextStyle(fontFamily: 'Circular', color: Colors.white54, fontSize: 16),),
                ),
              ],
            ),
          ),
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                  )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(() => CalculatorScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/calculator.png', height: 55,),
                          const SizedBox(height: 4,),
                          const Text('الآلة الحاسبة', style: TextStyle(
                            fontFamily: 'DGNemr', color: Colors.black, fontSize: 14,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  itemDashboard('التسجيل', Image.asset('assets/images/record.jpeg', height: 55,), Colors.deepOrange,() => Get.to(RecordScreen()),
                  ),
                  itemDashboard('حساب المعدل التراكمي', Image.asset('assets/images/gpa.png', height: 55,), Colors.green, () => Get.to( const GPACalculatorPage()),
                  ),
                  itemDashboard('الأسئلة الأكثر شيوعاً', Image.asset('assets/images/faq.png', height: 55,), Colors.purple,()=> Get.to( RecordScreen()),
                  ),
                  itemDashboard('صفحة الجامعة', Image.asset('assets/images/facebook.png', height: 55,), Colors.blue,()=> Get.to(launchUrl(facebookPage))),
                  itemDashboard('المكتبة', Image.asset('assets/images/library.png', height: 55,), Colors.indigo,()=>Get.to( RecordScreen())
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),

    );
  }
  itemDashboard(String title, Widget widget, Color background , Function() onPressed) => InkWell(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          const SizedBox(height: 8),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'DGNemr',
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
