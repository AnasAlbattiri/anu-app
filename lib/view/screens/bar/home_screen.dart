import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import '../home/calculator_screen.dart';
import '../home/record_screen.dart';

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
                          Image.asset('assets/images/calculator.png', height: 45,),
                          SizedBox(height: 4,),
                          Text('CALCULATOR', style: TextStyle(
                            fontFamily: 'Circular', color: Colors.black, fontSize: 14,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  itemDashboard('التسجيل', CupertinoIcons.person, Colors.deepOrange,() => Get.to(RecordScreen()),
                  ),
                  itemDashboard('Inpatients', CupertinoIcons.person_2, Colors.green, () => Get.to( RecordScreen()),
                  ),
                  itemDashboard('Analytics', CupertinoIcons.graph_circle, Colors.purple,()=> Get.to( RecordScreen()),
                  ),
                  itemDashboard('About', CupertinoIcons.question_circle, Colors.blue,()=> Get.to( RecordScreen())),
                  itemDashboard('Invoices', CupertinoIcons.money_dollar_circle, Colors.indigo,()=>Get.to( RecordScreen())
                  ),
                  itemDashboard('Upload', CupertinoIcons.add_circled, Colors.teal, ()=>Get.to( RecordScreen())
                  ),
                  itemDashboard('About', CupertinoIcons.question_circle, Colors.blue,()=>Get.to( RecordScreen())
                  ),
                  itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent, ()=>Get.to( RecordScreen())
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
  itemDashboard(String title, IconData iconData, Color background , Function() onPressed) => InkWell(
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child:  Icon(iconData, color: Colors.white),
          ),
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

