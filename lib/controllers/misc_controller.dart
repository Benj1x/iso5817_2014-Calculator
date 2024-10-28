import 'package:flutter/cupertino.dart';

import '../models/misc_model.dart';

class MiscController with ChangeNotifier{
  final MiscModel _model;

  MiscController(this._model);

  double get plateThickness => _model.plateThickness;
  double get weldTThickness => _model.weldTThickness;
  double get weldWidth => _model.weldWidth;

  bool get gradeB => _model.gradeB;
  bool get gradeC => _model.gradeC;
  bool get gradeD => _model.gradeD;

  void setCounter() {
    _model.setCounter();
  }
}