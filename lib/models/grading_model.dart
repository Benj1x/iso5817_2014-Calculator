
import 'package:iso5817_2014/models/form_model.dart';

class GradingModel
{
  final double _plateThickness = 0.0;
  final double _weldTThickness = 0.0;
  final double _weldWidth = 0.0;

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
  }
  // Gradingstruct calcData(){
  //   if(gradeB){
  //     return BGrading(a, t, b, isFilletWeld)
  //   }
  //   else if (gradeC){
  //     return CGrading(a, t, b, isFilletWeld)
  //   }
  //   else {
  //     return DGrading(s, a, t, b, isFilletWeld)
  //   }
  // }
}
