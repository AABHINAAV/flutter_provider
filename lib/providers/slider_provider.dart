import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double value = 1;

  double get getValue => value;

  void changeValue(double newValue) {
    value = newValue;
    notifyListeners();
  }
}
