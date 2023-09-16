
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  bool get getIsDark => isDark;

  void changeTheme() {
    isDark = !isDark;
    print("isDark : ${isDark}");
    notifyListeners();
  }
}