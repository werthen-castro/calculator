import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  late ThemeMode _mode;
  late Color contrasteColor;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void initMode() {
    contrasteColor = _mode == ThemeMode.light ? Colors.black : Colors.white;
    notifyListeners();
  }
}
