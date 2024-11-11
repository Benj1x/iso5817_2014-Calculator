// lib/controllers/counter_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:iso5817_2014/models/form_model.dart';

import '../models/grading_model.dart';

class GradingController with ChangeNotifier{
  final GradingModel _model;

  GradingController(this._model);

  double get plateThickness => _model.plateThickness;
  double get weldTThickness => _model.weldTThickness;
  double get weldWidth => _model.weldWidth;

  bool get gradeB => _model.gradeB;
  bool get gradeC => _model.gradeC;
  bool get gradeD => _model.gradeD;

  void calculateResults(FormModel formModel){
    _model.setData(formModel);
    //_model.calcData();
  }


}
