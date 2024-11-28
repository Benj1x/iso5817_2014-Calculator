
//import 'dart:ffi';

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

  bool _gradeB = false;
  bool _gradeC = false;
  bool _gradeD = false;

  Gradingstruct? _grades;

  double get plateThickness => _plateThickness;
  double get weldTThickness => _weldTThickness;
  double get weldWidth => _weldWidth;

  bool get gradeB => _gradeB;
  bool get gradeC => _gradeC;
  bool get gradeD => _gradeD;

  Gradingstruct? get grades => _grades;
  
  double setCounter() {
    return _weldTThickness;
  }

  void setData(FormModel formModel)
  {
    _plateThickness = formModel.t;
    _weldTThickness = formModel.a;
    _weldWidth = formModel.b;
    _gradeB = formModel.levelB;
    _gradeC = formModel.levelC;
    _gradeD = formModel.levelD;
  }
  void calcData()
  {
   
    if(gradeB)
    {
      _grades = BGrading(0.0, _weldTThickness, _plateThickness, _weldWidth, _isFilletWeld);
    }
    else if (gradeC)
    {
      _grades = CGrading(0.0, _weldTThickness, _plateThickness, _weldWidth, _isFilletWeld);
    }
    else if (gradeC)
    {
      _grades = DGrading(0.0, _weldTThickness, _plateThickness, _weldWidth, _isFilletWeld);
    }
  }
}
