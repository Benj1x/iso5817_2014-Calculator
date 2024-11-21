// lib/controllers/counter_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iso5817_2014/models/form_model.dart';
import 'package:iso5817_2014/util/gradingStruct.dart';
import 'package:iso5817_2014/views/grading_view.dart';

import '../models/grading_model.dart';
import '../views/main_view.dart';

class GradingController with ChangeNotifier{
  final GradingModel _model;

  GradingController(this._model);

  double get plateThickness => _model.plateThickness;
  double get weldTThickness => _model.weldTThickness;
  double get weldWidth => _model.weldWidth;

  bool get gradeB => _model.gradeB;
  bool get gradeC => _model.gradeC;
  bool get gradeD => _model.gradeD;

  //Gradingstruct? get grades => _model.grades;

  void calculateResults(FormModel formModel){
    _model.setData(formModel);
    _model.calcData();
  }

  void navigateToGradingView(BuildContext context) {
  final Gradingstruct? grades = _model.grades; // Assuming `_grades` is populated after `calculateResults`.

  if (grades != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GradingView(grades: grades),
      ),
    );
  } else {
    // Handle null grades if necessary.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('!Grades are not calculated yet!')),
    );
  }}
  void navigateFromGradingView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainView(),
      ),
    );
  }

}
