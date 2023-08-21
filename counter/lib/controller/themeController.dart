import 'package:flutter/material.dart';

class themeController extends ChangeNotifier {
  bool _isdark = false;

  get getTheme {
    return _isdark;
  }

  void changeTheme() {
    _isdark = !_isdark;
    notifyListeners();
  }
}
