// lib/controllers/counter_controller.dart
import 'package:iso5817_2014/models/grading_model.dart';

import '../models/counter_model.dart';

class GradingController {
  final GradingModel _model;

  CounterController(this._model);

  int get counter => _model.counter;

  void incrementCounter() {
    _model.incrementCounter();
  }
}
