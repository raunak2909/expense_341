import 'package:flutter/widgets.dart';

class NavigationProvider extends ChangeNotifier{
  int _index = 0;
  num _bal = 0;

  ///events
  int get navIndex => _index;

  set navIndex(int index) {
    _index = index;
    notifyListeners();
  }

  num get bal => _bal;

  set bal(num balance) {
    _bal = bal;
    notifyListeners();
  }
}