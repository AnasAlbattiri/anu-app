import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var formKey = GlobalKey<FormState>();

class GPACalculatorPage extends StatefulWidget {
   const GPACalculatorPage({super.key});
  @override
  _GPACalculatorPageState createState() => _GPACalculatorPageState();
}

class _GPACalculatorPageState extends State<GPACalculatorPage> {
  final _previousCGPAController = TextEditingController();
  final _totalPreviousCreditsController = TextEditingController();
  final List<TextEditingController> _scoreControllers = [];
  final List<TextEditingController> _creditControllers = [];
  double _cumulativeGPA = 0.0;
  // ignore: unused_field
  int _courseCount = 4;

  @override
  void dispose() {
    _previousCGPAController.dispose();
    _totalPreviousCreditsController.dispose();
    for (var controller in _scoreControllers) {
      controller.dispose();
    }
    for (var controller in _creditControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addCourse() {
    setState(() {
      _courseCount++;
      _scoreControllers.add(TextEditingController());
      _creditControllers.add(TextEditingController());
    });
  }

  void _removeCourse() {
    setState(() {
      _courseCount--;
      _scoreControllers.remove(TextEditingController());
      _creditControllers.remove(TextEditingController());
    });
  }

  void _calculateGPA() {
    final previousCGPA = double.tryParse(_previousCGPAController.text);
    final totalPreviousCredits = int.tryParse(_totalPreviousCreditsController.text);
    double totalScoreForCurrentSemester = 0.0;
    int totalCreditsForCurrentSemester = 0;

    if (previousCGPA == null || totalPreviousCredits == null) {
      print('Previous CGPA or total previous credits are not entered correctly.');
      return;
    }

    for (int i = 0; i < _courseCount; i++) {
      final score = double.tryParse(_scoreControllers[i].text);
      final credits = int.tryParse(_creditControllers[i].text);

      if (score == null || score < 10 || score > 100 || credits == null || credits <= 0) {
        print('Scores or credits for subject $i are not entered correctly.');
        return; // Early return if any score or credit is invalid.
      }

      totalScoreForCurrentSemester += score * credits;
      totalCreditsForCurrentSemester += credits;
    }


    // Calculate the cumulative GPA.
    if (totalCreditsForCurrentSemester > 0) {
      _cumulativeGPA = ((previousCGPA * totalPreviousCredits) + totalScoreForCurrentSemester) /
          (totalPreviousCredits + totalCreditsForCurrentSemester);
    }

    setState(() {
      print('Cumulative GPA calculated: $_cumulativeGPA');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? bColor : wColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'حساب المعدل التراكمي',
          style: TextStyle(
            fontFamily: 'DGEnab',
            fontSize: 16.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration:  BoxDecoration(
                  color: Get.isDarkMode ? bColor : wColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(200),
                  )),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),

                    TextFormField(
                      validator: (String? value){
                        if(value!.toString().isEmpty) {
                          return 'إذا لم يكن هناك معدل سابق أدخل 0';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      textAlign: TextAlign.end,
                      controller: _previousCGPAController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'ادخل المعدل التراكمي السابق',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintStyle: const TextStyle(
                          fontFamily: 'DGNemr',
                          fontSize: 16,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (String? value){
                        if(value!.toString().isEmpty) {
                          return 'إذا لم يكن هناك عدد ساعات سابقة أدخل 0';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      textAlign: TextAlign.end,
                      controller: _totalPreviousCreditsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'ادخل عدد الساعات السابقة',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintStyle: const TextStyle(
                          fontFamily: 'DGNemr',
                          fontSize: 16,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ...List<Widget>.generate(_courseCount, (index) {
                      // Assume 5 subjects.
                      _scoreControllers.add(TextEditingController());
                      _creditControllers.add(TextEditingController());
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 120.0,
                              child: TextFormField(
                                validator: (String? value){
                                  if(value!.toString().isEmpty) {
                                    return 'ألرجاء إدخال ساعات المادة';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                textAlign: TextAlign.end,

                                controller: _creditControllers[index],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'ساعات المادة ${index + 1}',
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  hintStyle: const TextStyle(
                                    fontFamily: 'DGNemr',
                                    fontSize: 12.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    10), // Provide some spacing between text fields.
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String? value){
                                    if(value!.toString().isEmpty) {
                                      return 'ألرجاء إدخال علامة المادة';
                                    }
                                    return null;
                                  },
                                  cursorColor: Colors.black,
                                  textAlign: TextAlign.end,
                                  controller: _scoreControllers[index],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'علامة المادة ${index + 1}',

                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    hintStyle: const TextStyle(
                                      fontFamily: 'DGNemr',
                                      fontSize: 12.0,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _addCourse, // Add Course button.
                          child:  const Text('أضف مادة', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'DGNemr',
                            color: Colors.white,


                          ),),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        if (_courseCount > 0)
                          ElevatedButton(
                          onPressed: _removeCourse, // Add Course button.
                          child: const Text('حذف مادة', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: 'DGNemr',
                            color: Colors.white,

                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed:(){
                        if(formKey.currentState!.validate())
                          {
                        _calculateGPA();
                          }
                      } ,
                      child: const Text(
                        'احسب المعدل التراكمي',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: 'DGNemr',
                          color: Colors.white,

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'المعدل التراكمي: ${_cumulativeGPA.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'DGNemr',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
