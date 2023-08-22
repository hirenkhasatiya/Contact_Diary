import 'package:counter_ex/Modals/counter_modal.dart';
import 'package:flutter/material.dart';

class counterController extends ChangeNotifier {
  Counter _counter = Counter();

  get getcounter {
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
