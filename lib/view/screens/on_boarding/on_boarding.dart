import 'package:anu_app/view/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final GetStorage authBox = GetStorage();
  var isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'جامعة عجلون الوطنية',
          style: TextStyle(fontFamily: 'DGEnab', color: wColor),
        ),
        backgroundColor: primaryColor,
      ),
      body: IntroductionScreen(
        rtl:true,
        globalBackgroundColor: wColor,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget:  Text(
              'مرحبا بك',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'DGNemr',
                color:  Get.isDarkMode ? wColor : bColor,
              ),
            ),
            bodyWidget:  Text('اهلا بك في جامعة عجلون الوطنية نتمنى لك رحلة دراسية موفقة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'DGNemr',
                color: Get.isDarkMode ? wColor : bColor,
              ),
            ),
            image: CircleAvatar(
              radius: 120,
              backgroundColor: Get.isDarkMode ? bColor : wColor,
              child: Container(
                decoration: BoxDecoration(
                    color: Get.isDarkMode ? bColor : wColor,
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(image: AssetImage('assets/images/onBoarding/welcomOnboard.jpg',),)
                ),
              ),
            ),
          ),
          PageViewModel(
            titleWidget:  Text(
              'نبدة عن الجامعة',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'DGNemr',
                color: Get.isDarkMode ? wColor : bColor,
              ),
            ),
            bodyWidget:  Text('أسسـت جامعة عجلون الوطنية الخاصة وحصـلت علـى الترخيـص بموجب قرار رقم (1/2008) بتاريخ 5/1/2008، والاعتماد العام بموجب قرار رقم (25/1/2008) بتاريخ (5/10/2009) وهي تسعى منذ تأسيسها إلى أن تكون شريكاً فاعلاً في الجهود الوطنية والإقليمية الهادفة للارتقاء بنوعية التعليم الجامعي وتوفير بيئة جامعية تلتزم بتوفير أفضل وسائل الحرية والإبداع واستقطاب الطلاب المؤهلين للتعليم الجامعي من الأردن والدول المجاورة والأجنبية وإتاحة الفرصة الكافية لهؤلاء الطلبة من أجل التفاعل مع المجتمع المحلي والإقليمي والدولي .',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'DGNemr',
                color: Get.isDarkMode ? wColor : bColor,
              ),
            ),
            image: CircleAvatar(
              radius: 120,
              backgroundColor:  Get.isDarkMode ? bColor : wColor,
              child: Container(
                decoration: BoxDecoration(
                    color:  Get.isDarkMode ? bColor : wColor,
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(image: AssetImage('assets/images/onBoarding/anuwW.png',),)
                ),
              ),
            ),
          ),
          PageViewModel(
            titleWidget:  Text(
              'كلمة رئيس الجامعة',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'DGNemr',
                color:  Get.isDarkMode ? wColor : bColor,
              ),
            ),
            bodyWidget:  Text('لقد تم تأسيس جامعة عجلون الوطنية، بخطوات مدروسة وحكيمة، في رحاب هذه المحافظة الخضراء،الباسقة بجبالها، والريانة بأوديتها، و الضاربة في جذورها الحضارية والتاريخية، لتسهم في الارتقاء بالمستوى اللائق من التعليم الجامعي، ولكي ترفد هذا الوطن الأعز بإمكاناتها العلمية والمعرفية، لما تحتضنه من كوادر مؤهلة، ومن قدرات متقدمة وخبرات تعليمية فاعلة، آخذين بعين الاعتبار المعايير، والقوانين، والأنظمة الضابطة للمسيرة التعليمية الراقية،الوطنية والدولية، لا سيما المتعلقة بتطوير البنى الفكرية، والعلمية الفعّالة والمنتجة في آن.',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'DGNemr',
                color: Get.isDarkMode ? wColor : bColor,
              ),
            ),
            image: CircleAvatar(
              radius: 120,
              backgroundColor: Get.isDarkMode ? bColor : wColor,
              child: Container(
                decoration: BoxDecoration(
                    color: Get.isDarkMode ? bColor : wColor,
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(image: AssetImage('assets/images/dr.feras-hnandeh.jpg',),)
                ),
              ),
            ),
          ),
        ],
        onDone: () {
          Get.off(()=>MainScreen());
          isSignedIn = true;
          authBox.write('auth', isSignedIn);
        },
        onSkip: () {
          Get.off(()=>MainScreen());
          isSignedIn = true;
          authBox.write('auth', isSignedIn);

        },
        showSkipButton: true,
        dotsDecorator: const DotsDecorator(
          activeColor: primaryColor,
        ),
        skip: const Text(
          'تخطي',
          style: TextStyle(
            color: primaryColor,
            fontSize: 13.0,
            fontFamily: 'DGNemr',
          ),
        ),
        next: const Icon(
          Icons.arrow_back,
          color: primaryColor,
        ),
        done: const Text(
          'تم',
          style: TextStyle(
            color: primaryColor,
            fontSize: 13.0,
            fontFamily: 'DGNemr',
          ),
        ),
      ),
    );
  }
}
