import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import '../../Navigation/NavigatorClass.dart';
import '../Api/Api.dart';
import '../entity/analyse.dart';
import '../entity/person.dart';
import 'package:medic/Domain/Hive/hive.dart';

import '../flutterSecureStorage/flutterSecureStore.dart';

class createCardModel {
  String name = "";
  String surname = "";
  String patronymic = "";
  String dob = "";
  int gender = -1;

  createCardModel() {}

  void createCardUser(BuildContext context, String name, String surname,
      String patronymic, String dob, int gender) async {
    createUser(name, surname, patronymic, dob, gender);
    goToMainScreen(context);
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: FluttSecureStorage.key);
    await api.createCardUser(name, surname, patronymic, dob, gender, token!);
    goToMainScreen(context);
  }

  void createUser(String name, String surname, String patronymic, String dob,
      int gender) async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(personAdapter());
    }
    final box = await Hive.openBox<person>(namesBox.listPersonDataBox);
    final Person = person(
        name: name,
        surname: surname,
        patronymic: patronymic,
        birthday: dob,
        gender: gender);
    await box.add(Person);
  }

  void goToMainScreen(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.mainScreenCardPath);
  }
}
