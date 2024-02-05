import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth/auth_text_form_field.dart';

final gpaController = TextEditingController();
final markController = TextEditingController();
final ob1Controller = TextEditingController();
final ob2Controller = TextEditingController();
final ob3Controller = TextEditingController();
final ob4Controller = TextEditingController();
final ob5Controller = TextEditingController();
final ob6Controller = TextEditingController();
final ob7Controller = TextEditingController();

final hr1Controller = TextEditingController();
final hr2Controller = TextEditingController();
final hr3Controller = TextEditingController();
final hr4Controller = TextEditingController();
final hr5Controller = TextEditingController();
final hr6Controller = TextEditingController();
final hr7Controller = TextEditingController();
class GpaScreen extends StatelessWidget {
  GpaScreen({super.key});





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('حساب المعدل',style: TextStyle(
          fontFamily: 'DGEnab',
        ),),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 100),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                  )),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  AuthTextFormField(
                    textAlign: TextAlign.end,
                    controller: gpaController,
                    textInputType: TextInputType.number,
                    isPassword: false,
                    hint: 'ألمعدل قبل الفصل الحالي',
                    hintStyle: const TextStyle(
                      fontFamily: 'DGNemr',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  AuthTextFormField(
                    textAlign: TextAlign.end,
                    controller: markController,
                    textInputType: TextInputType.number,
                    isPassword: false,
                    hint: 'عدد الساعات التي قطعتها قبل الفصل الحالي',
                    hintStyle: const TextStyle(
                      fontFamily: 'DGNemr',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: hr1Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'عدد الساعات',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: ob1Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'علامة المادة 1',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: hr2Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'عدد الساعات',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: ob2Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'علامة المادة 2',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: hr3Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'عدد الساعات',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: ob3Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'علامة المادة 3',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: hr4Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'عدد الساعات',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: ob4Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'علامة المادة 4',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: hr5Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'عدد الساعات',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: ob5Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'علامة المادة 5',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: hr6Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'عدد الساعات',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: ob6Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'علامة المادة 6',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: hr7Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'عدد الساعات',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 150.0,
                        child: AuthTextFormField(
                          textAlign: TextAlign.end,
                          controller: ob7Controller,
                          textInputType: TextInputType.number,
                          isPassword: false,
                          hint: 'علامة المادة 7',
                          hintStyle: const TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    width: 150.0,
                    child: ElevatedButton(
                        onPressed: () {

                        },
                        child:  const Text(
                          'احسب معدلك',
                          style: TextStyle(
                            fontFamily: 'DGNemr',
                          ),
                        ),
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
