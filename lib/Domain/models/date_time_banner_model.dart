import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:medic/Domain/Hive/hive.dart';

class dateTimeBannerModel extends ChangeNotifier {
  DateTime dob = DateTime.now();
  bool dayValide = false;
  bool timeValide = false;
  int index = -1;
  final dropValue = ValueNotifier('');


  void setDayValide() {
    dob.day != 0 ? dayValide = true : dayValide = false;
    notifyListeners();
  }

  void setTimeValide() {
    dob.hour != 0 ? timeValide = true : timeValide = false;
    notifyListeners();
  }

  void setIndex(int Index) {
    index = Index;
    notifyListeners();
  }

  Future<void> saveDate(DateTime value) async{
    final box = await Hive.openBox<DateTime>(namesBox.dateDataBox);
    await box.put('dateVal', value);
    notifyListeners();
  }

}