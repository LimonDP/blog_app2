import 'package:flutter/material.dart';

class ValueIncrement extends ChangeNotifier {
  int value = 0;
  valueChange() {
    value++;
    notifyListeners();
  }
}
