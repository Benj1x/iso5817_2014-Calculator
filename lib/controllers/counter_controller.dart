// lib/controllers/counter_controller.dart
import '../models/counter_model.dart';
import 'package:iso5817_2014/util/gradingStruct.dart';
class CounterController {
  final CounterModel _model;

  CounterController(this._model);//All counter stuff, is just a template I'm following

  int get counter => _model.counter;

  void incrementCounter() {
    _model.incrementCounter();
  }
  void setCounter() {
    _model.setCounter();
  }

}
