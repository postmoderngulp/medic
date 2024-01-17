import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:medic/Domain/entity/analyse.dart';
import 'package:medic/Navigation/NavigatorClass.dart';
import 'package:medic/Domain/Hive/hive.dart';

class oneOfferScreenModel extends ChangeNotifier {
  List<analyse> listBasket = [];
  List<analyse> listSort = [];

  oneOfferScreenModel() {
    _setup();
  }

  void sort(List<analyse> list) {
    for (int i = 0; i < list.length; i++) {
      listSort.add(list[i]);
    }
    listSort = listSort.toSet().toList();
    notifyListeners();
  }

  void _setup() async {
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    listBasket = box.values.toList();
    sort(listBasket);
    notifyListeners();
  }

  void clearBasket(BuildContext context) async {
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    await box.clear();
    _setup();
    Navigator.of(context).pushNamed(NavigatorPaths.mainScreenCardPath);
  }

  void deleteElement(analyse el, BuildContext context) async {
    listBasket.removeWhere((element) => element == el);
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    await box.clear();
    await box.addAll(listBasket);
    if (listBasket.isEmpty) {
      Navigator.of(context).pushNamed(NavigatorPaths.mainScreenCardPath);
    }
    notifyListeners();
  }

  void plusCount(analyse el) async {
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    await box.add(el);
    _setup();
  }

  void minCount(analyse el, BuildContext context) async {
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    listBasket.remove(el);
    await box.clear();
    await box.addAll(listBasket);
    listBasket.clear();
    listBasket = box.values.toList();
    if (listBasket.isEmpty) {
      Navigator.of(context).pushNamed(NavigatorPaths.mainScreenCardPath);
    }
    notifyListeners();
  }

  void goToPatienceOrder(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.patientsOfferPath);
  }
}
