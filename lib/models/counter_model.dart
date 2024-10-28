// lib/models/counter_model.dart
import 'dart:developer' as developer;


class CounterModel {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
  }
  void setCounter() {
    _counter = _counter + 1;

    developer.log(_counter.toString());
  }
}
