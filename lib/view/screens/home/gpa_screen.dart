import 'package:anu_app/utils/constants.dart';
import 'package:flutter/material.dart';

class GPACalculatorPage extends StatefulWidget {
  @override
  _GPACalculatorPageState createState() => _GPACalculatorPageState();
}

class _GPACalculatorPageState extends State<GPACalculatorPage> {
  final _previousCGPAController = TextEditingController();
  final _totalPreviousCreditsController = TextEditingController();
  final List<TextEditingController> _scoreControllers = [];
  final List<TextEditingController> _creditControllers = [];
  double _cumulativeGPA = 0.0;
  int _courseCount = 0;


  @override
  void dispose() {
    _previousCGPAController.dispose();
    _totalPreviousCreditsController.dispose();
    _scoreControllers.forEach((controller) => controller.dispose());
    _creditControllers.forEach((controller) => controller.dispose());
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
      print('Previous CGPA or total previous credits are not entered correctly.');
      return;
    }

    for (int i = 0; i < _scoreControllers.length; i++) {
      final score = double.tryParse(_scoreControllers[i].text);
      final credits = int.tryParse(_creditControllers[i].text);

      if (score == null || credits == null || score < 10 || score > 100 || credits <= 0) {
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
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('حساب المعدل التراكمي', style: TextStyle(
          fontFamily: 'DGEnab',
          fontSize: 18,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _previousCGPAController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'المعدل التراكمي السابق',
                  labelStyle: TextStyle(
                    fontFamily: 'DGNemr',
                    fontSize: 14,

                  ),
                  hintText: 'ادخل المعدل التراكمي السابق',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(
                    fontFamily: 'DGNemr',

                    fontSize: 16,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _totalPreviousCreditsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'عدد الساعات السابقة',
                  labelStyle: TextStyle(
                    fontFamily: 'DGNemr',
                    fontSize: 14,

                  ),
                  hintText: 'ادخل عدد الساعات السابقة',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(
                    fontFamily: 'DGNemr',

                    fontSize: 16,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              ),
              ...List<Widget>.generate(5, (index) { // Assume 5 subjects.
                _scoreControllers.add(TextEditingController());
                _creditControllers.add(TextEditingController());
                return Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _scoreControllers[index],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'علامة المادة ${index + 1}',
                            labelStyle: TextStyle(
                              fontFamily: 'DGNemr',
                              fontSize: 14,

                            ),
                            hintText: 'ادخل علامة المادة',
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintStyle: TextStyle(
                              fontFamily: 'DGNemr',

                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Provide some spacing between text fields.
                    Expanded(
                      child: TextField(
                        controller: _creditControllers[index],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'ساعات المادة ${index + 1}',
                          labelStyle: TextStyle(
                            fontFamily: 'DGNemr',
                            fontSize: 14,

                          ),
                          hintText: 'ادخل عدد الساعات',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintStyle: TextStyle(
                            fontFamily: 'DGNemr',

                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: _addCourse, // Add Course button.
                child: Text('أضف مادة', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'DGNemr',

                ),),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: _calculateGPA,
                child: Text('احسب المعدل التراكمي', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'DGNemr',

                ),),
              ),
              SizedBox(height: 10,),
              Text(
                'المعدل التراكمي: ${_cumulativeGPA.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'DGNemr',

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
