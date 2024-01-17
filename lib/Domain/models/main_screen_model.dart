import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:medic/Domain/entity/analyse.dart';
import 'package:medic/Domain/entity/box_analyse.dart';
import 'package:medic/Domain/Hive/hive.dart';

import '../Api/Api.dart';

class mainScreenModel extends ChangeNotifier {
  List<dynamic> listAnalyse = [
    analyse(
        title: "Клинический анализ крови с лейкоцитарной формулой",
        description:
            "Клинический анализ крови – это самое важное комплексное лабораторное исследование при обследовании человека с любым заболеванием. Изменение исследуемых показателей, как правило, происходит задолго до появления видимых симптомов болезни. ",
        preparation:
            "Кровь следует сдавать утром натощак, днем или вечером – через 4-5 часов после последнего приема пищи.",
        biomaterial: "Венозная кровь",
        resultDuring: "8",
        days: "2",
        price: 1000),
    analyse(
        title: "ПЦР-тест на определение РНК коронавируса стандартный",
        description:
            "Клинический анализ крови – это самое важное комплексное лабораторное исследование при обследовании человека с любым заболеванием. Изменение исследуемых показателей, как правило, происходит задолго до появления видимых симптомов болезни. ",
        preparation:
            "Кровь следует сдавать утром натощак, днем или вечером – через 4-5 часов после последнего приема пищи.",
        biomaterial: "Венозная кровь",
        resultDuring: "8",
        days: "2",
        price: 1800),
  ];
  List<analyse> basketList = [];
  List<String> catalog = ['Популярные', 'Covid', 'Комплексные'];
  int Index = 0;

  mainScreenModel() {
    _setup();
  }

  void setVal(int index) {
    Index = index;
    notifyListeners();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(analyseAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(boxAnalyseAdapter());
    }
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    basketList = box.values.toList();
    getAnalyse();
    notifyListeners();
  }

  getAnalyse() async {
    final api = Api();
    boxAnalyse list = await api.getAnalyse();
    listAnalyse = list.listAnalyse;
    notifyListeners();
  }

  void addAnalyse(int index) async {
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    box.add(listAnalyse[index]);
    _setup();
  }

  void removeAnalyse(int index) async {
    final box = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    basketList.removeWhere((element) => element == listAnalyse[index]);
    await box.clear();
    await box.addAll(basketList);
    _setup();
  }
}
