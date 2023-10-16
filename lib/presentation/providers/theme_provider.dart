import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    _getTheme();
  }

  _getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("is_dark") ?? true) {
      theme = ThemeMode.dark;
    } else {
      theme = ThemeMode.light;
    }
    notifyListeners();
  }

  ThemeMode theme = ThemeMode.light;

  Future<void> toggleTheme() async {
    theme = (theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
    notifyListeners();
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_dark", theme == ThemeMode.dark);
  }
}
