

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider with ChangeNotifier{
bool _isDarkMode=true;
bool get isDarkMode => _isDarkMode;
ThemeMode get currentTheme => _isDarkMode ?ThemeMode.dark:ThemeMode.light;

  void toggleTheme(){
    _isDarkMode=!isDarkMode;
    notifyListeners();
  }
}