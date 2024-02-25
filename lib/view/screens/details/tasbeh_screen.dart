import 'package:anu_app/logic/tasbeeh/tasbeh_controller.dart';
import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/default_button.dart';

class TasbehScreen extends StatelessWidget {
   TasbehScreen({super.key});
   final controller = Get.put(TasbehController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      appBar: AppBar(
        title: const Text(
          'المسبحة الإلكترونية',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'DGEnab',
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Obx(()=> Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: wColor,
              child: Image.asset('assets/images/Mosque.png'),
            ),
            const SizedBox(
              height: 50,
            ),
             Text(
              '${controller.counter.value}',
              style: const TextStyle(
                fontFamily: 'Circular',
                fontSize: 40,
              ),
            ),
            const Text(
              'عدد التسبيح',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'DGNemr',
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            DefaultButton(
              onPressed: () {
                controller.addToCounter();
              },
              text: 'سبح',
            ),
            const SizedBox(
              height: 50.0,
            ),
            IconButton(
              onPressed: () {
                controller.resetCounter();
              },
              icon: const Icon(
                Icons.refresh_outlined,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
