import 'package:counter/Modals/controller_model.dart';
import 'package:flutter/material.dart';

class counterController extends ChangeNotifier {
  Counter _counter = Counter();

  get getCounter {
    return _counter.counter;
  }

  void increase() {
    _counter.counter++;
    notifyListeners();
  }

  void decrease() {
    _counter.counter--;
    notifyListeners();
  }
}
