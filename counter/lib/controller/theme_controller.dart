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
    preferences.setBool('theme', _isdark);
    _isdark = !_isdark;
    notifyListeners();
  }
}
