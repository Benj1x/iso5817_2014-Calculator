
import 'dart:ffi';

import 'package:iso5817_2014/models/form_model.dart';

import '../util/gradingStruct.dart';
import 'gradingB.dart';
import 'gradingC.dart';
import 'gradingD.dart';

class GradingModel
{
  double _plateThickness = 0.0;
  double _weldTThickness = 0.0;
  double _weldWidth = 0.0;

  bool _isFilletWeld = true;

  bool gradeB = false;
  bool gradeC = false;
  bool gradeD = false;

  

  double get plateThickness => _plateThickness;
  double get weldTThickness => _weldTThickness;
  double get weldWidth => _weldWidth;
  double setCounter() {
    return _weldTThickness;
  }

  void setData(FormModel formModel)
  {
    _plateThickness = formModel.t;
    _weldTThickness = formModel.a;
    _weldWidth = formModel.b;
  }
  Gradingstruct calcData()
  {
   
    if(gradeB)
    {
      return BGrading(_weldTThickness, _plateThickness, _weldWidth, _isFilletWeld);
    }
    else if (gradeC)
    {
      return CGrading(0.0, _weldTThickness, _plateThickness, _weldWidth, _isFilletWeld);
    }
    else if (gradeC)
    {
      return DGrading(0.0, _weldTThickness, _plateThickness, _weldWidth, _isFilletWeld);
    }
    return new Gradingstruct();
  }
}
