import 'package:flutter/material.dart';
import '../models/misc_model.dart';

class MiscController with ChangeNotifier{
  final MiscModel _model;

  // Expose TextEditingControllers expected by the View
  final TextEditingController aCtrl = TextEditingController();
  final TextEditingController zCtrl = TextEditingController();

  MiscController(this._model) {
    // seed fields from model
    aCtrl.text = _fmt(_model.a);
    zCtrl.text = _fmt(_model.z);
  }

  // Optional getters if you use them elsewhere
  double get a => _model.a;
  double get z => _model.z;

  // View calls this: a -> z
  void computeZFromA() {
    final aVal = double.tryParse(aCtrl.text.replaceAll(',', '.'));
    if (aVal == null) return;
    _model.a = aVal;
    _model.calculateAToZ();           // updates model.z
    zCtrl.text = _fmt(_model.z);      // reflect new z in the field
    notifyListeners();
  }

  // View calls this: z -> a
  void computeAFromZ() {
    final zVal = double.tryParse(zCtrl.text.replaceAll(',', '.'));
    if (zVal == null) return;
    _model.z = zVal;
    _model.calculateZToA();           // updates model.a
    aCtrl.text = _fmt(_model.a);      // reflect new a in the field
    notifyListeners();
  }

  // View calls this for navigation
  void onCalcAcceptancePressed(BuildContext context) {
    Navigator.of(context).pushNamed('/grading');
  }

  String _fmt(num v) => v.toStringAsFixed(3);

  @override
  void dispose() {
    aCtrl.dispose();
    zCtrl.dispose();
    super.dispose();
  }
}
