import 'package:anu_app/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Uri libraryWeb = Uri.parse('https://search.ebscohost.com/login.aspx');
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'المكتبة الإلكترونية',
          style: TextStyle(
            fontFamily: 'DGEnab',
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/images/library1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/images/library2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/images/library3.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
              options: CarouselOptions(
                height: 200,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn, // شكل الاينيميشن (بجنن)
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 10.0,
                dotWidth: 10.0,
                activeDotColor: primaryColor,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'نبذة عن المكتبة',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DGEnab'),
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'مكتبة جامعة عجلون الوطنية، التي تأسست مع انطلاقة الجامعة عام 2009، تهدف إلى دعم العملية التعليمية والبحثية وخدمة المجتمع المحلي بتوفير مصادر المعلومات الورقية والإلكترونية لأعضاء الهيئة التدريسية، الإدارية والطلاب. المكتبة بمساحة 1654 مترًا مربعًا، تضم 33450 كتابًا و24500 عنوانًا بالعربية والإنجليزية، بالإضافة إلى 99 دورية واشتراك في قاعدة بيانات EBSCO بـ192600 عنوان. تحتوي أيضًا على مختبر حاسوب بـ20 جهازًا وتعتمد نظام تصنيف مكتبة الكونغرس. تفتح من السبت إلى الأربعاء من الثامنة صباحًا حتى نهاية الدوام الرسمي.',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 14.0, fontFamily: 'DGEnab'),
                ),
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20.0,
            ),
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'للوصول الى كتب المكتبة الكترونيا',
                style: TextStyle(fontSize: 20.0, fontFamily: 'DGEnab'),
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'ادخل الى الرابط وضع اسم المستخدم وكلمة السر المرفقان ادناه:',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 14.0, fontFamily: 'DGEnab'),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    FadeTransition(
                      opacity: _animation,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SelectableText(
                          'UserName: anuj2018',
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Circular'),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _animation,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SelectableText(
                          'Password: library2020@',
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Circular'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15.0,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  launchUrl(libraryWeb);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  maximumSize: const Size(200, 50),
                  backgroundColor: primaryColor,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'الرابط',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'DGNemr',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
