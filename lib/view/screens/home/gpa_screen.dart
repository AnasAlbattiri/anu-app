import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';

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
  int _courseCount = 1;


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


  void _calculateGPA() {
    final previousCGPA = double.tryParse(_previousCGPAController.text);
    final totalPreviousCredits = int.tryParse(_totalPreviousCreditsController.text);
    double totalScoreForCurrentSemester = 0.0;
    int totalCreditsForCurrentSemester = 0;

    if (previousCGPA == null || totalPreviousCredits == null) {
      // ignore: avoid_print
      print('Previous CGPA or total previous credits are not entered correctly.');
      return;
    }

    for (int i = 0; i < _scoreControllers.length; i++) {
      final score = double.tryParse(_scoreControllers[i].text);
      final credits = int.tryParse(_creditControllers[i].text);

      if (score == null || credits == null || score < 10 || score > 100 || credits <= 0) {
        // ignore: avoid_print
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
      // ignore: avoid_print
      print('Cumulative GPA calculated: $_cumulativeGPA');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('حساب المعدل التراكمي', style: TextStyle(
          fontFamily: 'DGEnab',
          fontSize: 18,
        ),),
      ),
      body: Stack(
        children: [
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
    ),
        ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0,),
                  TextField(
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
                  const SizedBox(height: 10,),
                  TextField(
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
                  ...List<Widget>.generate(_courseCount, (index) { // Assume 5 subjects.
                    _scoreControllers.add(TextEditingController());
                    _creditControllers.add(TextEditingController());
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 120.0,
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              textAlign: TextAlign.end,
                              controller: _creditControllers[index],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'ساعات المادة ${index + 1}',
                                labelStyle: const TextStyle(
                                  fontFamily: 'DGNemr',
                                  fontSize: 14,

                                ),
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
                          ),
                          const SizedBox(width: 10), // Provide some spacing between text fields.
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                cursorColor: Colors.black,
                                textAlign: TextAlign.end,
                                controller: _scoreControllers[index],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'علامة المادة ${index + 1}',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'DGNemr',
                                    fontSize: 14,

                                  ),
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
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: _addCourse, // Add Course button.
                    child: const Text('أضف مادة', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'DGNemr',

                    ),),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: _calculateGPA,
                    child: const Text('احسب المعدل التراكمي', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'DGNemr',

                    ),),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    'المعدل التراكمي: ${_cumulativeGPA.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'DGNemr',

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