
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

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
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 75),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Student!', style: TextStyle(fontFamily: 'Circular', color: Colors.white, fontSize: 22),),
                  subtitle: Text('Good Morning', style: TextStyle(fontFamily: 'Circular', color: Colors.white54, fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/bajes.jpeg'),
                  ),
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
                  itemDashboard('Outpatients', CupertinoIcons.person, Colors.deepOrange, ),
                  itemDashboard('Inpatients', CupertinoIcons.person_2, Colors.green, ),
                  itemDashboard('Analytics', CupertinoIcons.graph_circle, Colors.purple, ),
                  itemDashboard('About', CupertinoIcons.question_circle, Colors.blue, ),
                  itemDashboard('Invoices', CupertinoIcons.money_dollar_circle, Colors.indigo, ),
                  itemDashboard('Upload', CupertinoIcons.add_circled, Colors.teal, ),
                  itemDashboard('About', CupertinoIcons.question_circle, Colors.blue, ),
                  itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent, ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)

        ],
      ),

    );
  }
  itemDashboard(String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5
          )
        ]
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
            child: Icon(iconData, color: Colors.white)
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: TextStyle(fontFamily: 'Circular', color: Colors.black, fontSize: 14),),
      ],
    ),
  );
}

