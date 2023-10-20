import 'package:flutter/cupertino.dart';

class ChooseTestModel extends ChangeNotifier {
  int index = 0;

  void setOne() {
    index = 0;
    notifyListeners();
  }

  void setTwo() {
    index = 1;
    notifyListeners();
  }

  void setThree() {
    index = 2;
    notifyListeners();
  }
}
