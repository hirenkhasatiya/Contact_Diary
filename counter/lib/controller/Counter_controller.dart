import 'package:counter/Modals/controller_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class counterController extends ChangeNotifier {
  Counter _counter = Counter();

  late SharedPreferences preferences;

  counterController({required this.preferences});

  get getCounter {
    _counter.counter = preferences.getInt('counter') ?? 0;
    return _counter.counter;
  }

  void increase() {
    _counter.counter++;

    preferences.setInt('counter', _counter.counter);
    notifyListeners();
  }

  void decrease() {
    _counter.counter--;
    preferences.setInt('counter', _counter.counter);
    notifyListeners();
  }
}
