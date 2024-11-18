// lib/views/counter_view.dart
import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatefulWidget {
  final CounterController controller;

  const CounterView({Key? key, required this.controller}) : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVC Counter"),
      ),
      body: Center(
        child: Text(
          'Counter: ${widget.controller.counter}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.controller.setCounter();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
