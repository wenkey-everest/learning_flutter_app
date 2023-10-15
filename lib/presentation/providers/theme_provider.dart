import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  void toggleTheme() {
    theme = (theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
    notifyListeners();
  }
}
