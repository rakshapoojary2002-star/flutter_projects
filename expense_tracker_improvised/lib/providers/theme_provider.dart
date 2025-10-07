import 'package:expense_tracker/theme.dart';
import 'package:flutter/material.dart';
//import 'theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  /// Returns the appropriate ThemeData from the new MaterialTheme
  ThemeData getTheme(TextTheme textTheme) {
    return isDarkMode
        ? MaterialTheme(textTheme).theme(MaterialTheme.darkScheme())
        : MaterialTheme(textTheme).theme(MaterialTheme.lightScheme());
  }

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;
}
