import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int value = 0;

  increment() {
    value++;

    notifyListeners();
  }
}
