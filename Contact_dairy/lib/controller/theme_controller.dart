import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themeController extends ChangeNotifier {
  bool _isdark = false;

  late SharedPreferences preferences;

  themeController({required this.preferences});

  get getTheme {
    _isdark = preferences.getBool('theme') ?? false;
    return _isdark;
  }

  void changeTheme() {
    _isdark = !_isdark;
    preferences.setBool('theme', _isdark);
    notifyListeners();
  }
}
