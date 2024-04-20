import 'package:anu_app/utils/constants.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorDetailsScreen extends StatefulWidget {
  DoctorDetailsScreen({Key? key, required this.softwareDocsModel})
      : super(key: key);
  final dynamic softwareDocsModel;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  final copyController = TextEditingController();
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a delay
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final Uri uniNumber = Uri.parse('tel:(02) 646 6616');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 440,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.softwareDocsModel.image),
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
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 300),
                                opacity: _isVisible ? 1.0 : 0.0,

                                child: Text(
                                  widget.softwareDocsModel.title,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DGNemr',
                                      fontSize: 36),
                                ),
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
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: _isVisible ? 1.0 : 0.0,

                            child: const Text(
                              "نبذة عن الدكتور",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'DGNemr',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: _isVisible ? 1.0 : 0.0,

                            child: Text(
                              widget.softwareDocsModel.about,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: _isVisible ? 1.0 : 0.0,

                            child: const Text(
                              "التخصص",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'DGNemr',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: _isVisible ? 1.0 : 0.0,

                            child: Text(
                              widget.softwareDocsModel.education,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: _isVisible ? 1.0 : 0.0,
                            child: const Text(
                              "البريد الإلكتروني",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'DGNemr',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.softwareDocsModel.email,
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
                                    minimumSize: const Size(150, 50),
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
                                    Get.defaultDialog(
                                      title: 'ملاحظة',
                                      titleStyle: const TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'DGEnab',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      content: Column(
                                        children: [
                                          const Text(
                                            'بعد الإتصال ادخل رقم الدكتور الارضي ادناه',
                                            style: TextStyle(
                                              fontFamily: 'DGEnab',
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          // ignore: unnecessary_new
                                          TextFormField(
                                            controller: copyController
                                              ..text = widget.softwareDocsModel.phone,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'DGEnab',
                                            ),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffix: IconButton(
                                                  onPressed: () {
                                                    FlutterClipboard.copy(
                                                        copyController.text);
                                                    Get.snackbar(
                                                      'تم النسخ',
                                                        'تم النسخ الى الحافظة بنجاح',
                                                      colorText: Colors.white,
                                                      duration: const Duration(seconds: 2),
                                                    );
                                                  },
                                                  icon: const Icon(Icons.copy)),
                                              disabledBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                          ),
                                        ],
                                      ),

                                      confirmTextColor: Colors.white,
                                      cancelTextColor: Colors.black,
                                      buttonColor: primaryColor,
                                      cancel: MaterialButton(
                                        height: 40,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0)),
                                        color: primaryColor,
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text(
                                          'الغاء',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'DGEnab',
                                          ),
                                        ),
                                      ),
                                      confirm: MaterialButton(
                                        height: 40,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0)),
                                        color: primaryColor,
                                        onPressed: () {
                                          launchUrl(uniNumber);
                                        },
                                        child: const Text(
                                          'اتصل',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'DGEnab',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(150, 50),
                                    backgroundColor: wColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        'اتصل',
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
      ),
    );
  }
}
