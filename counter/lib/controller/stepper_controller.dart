import 'package:flutter/material.dart';

class stepperController extends ChangeNotifier {
  int _currentIndex = 0;

  get getIndex {
    return _currentIndex;
  }

  void Continue() {
    if (_currentIndex < 2) {
      _currentIndex++;
    }
    notifyListeners();
  }

  void cancel() {
    if (_currentIndex > 0) {
      _currentIndex--;
    }
    notifyListeners();
  }
}
