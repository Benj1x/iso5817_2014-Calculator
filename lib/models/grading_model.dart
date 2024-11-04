
import 'dart:ffi';
import 'dart:math';
import 'dart:developer' as developer;

import 'package:iso5817_2014/models/form_model.dart';

class GradingModel
{
  double _plateThickness = 0.0;
  double _weldTThickness = 0.0;
  double _weldWidth = 0.0;

  bool gradeB = false;
  bool gradeC = false;
  bool gradeD = false;

  double get plateThickness => _plateThickness;
  double get weldTThickness => _weldTThickness;
  double get weldWidth => _weldWidth;
  double setCounter() {
    return _weldTThickness;
  }

  void setData(FormModel formModel){
    String test = formModel.t;
    developer.log(test);
    developer.log(formModel.t);
    developer.log(formModel.b);
    _plateThickness = double.parse(formModel.t);
    _weldTThickness = double.parse(formModel.a);
    _weldWidth = double.parse(formModel.b);
  }
}
