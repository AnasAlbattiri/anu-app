import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
     GetStorage().read<bool>('auth') == true ? Get.offNamed('/main') : Get.offNamed('/onBoard');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        // width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/onBoarding/anuwW.png',),
              height: 200,
              width: 200,
            ),
            SizedBox(height: 30,),
            SpinKitThreeBounce(
              color: wColor,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}