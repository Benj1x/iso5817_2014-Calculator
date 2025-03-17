import 'package:flutter/cupertino.dart';

import '../models/misc_model.dart';

class MiscController with ChangeNotifier{
  final MiscModel _model;

  MiscController(this._model);

  double get a => _model.a;
  double get z => _model.z;
  double get ZToA => _model.ZToA;
  double get AToZ => _model.ZToA;

  void calculate() {
   _model.CalculateAToZ();
   _model.CalculateZToA();
  }
}