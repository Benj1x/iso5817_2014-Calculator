import 'package:flutter/cupertino.dart';

import '../models/misc_model.dart';

class MiscController with ChangeNotifier{
  final MiscModel _model;

  MiscController(this._model);

  double get a => _model.a;
  double get z => _model.z;

  void setCounter() {
    _model.setCounter();
  }
}