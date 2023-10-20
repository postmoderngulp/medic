import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medic/Domain/Api/Api.dart';
import 'package:medic/Domain/entity/person.dart';

import '../flutterSecureStorage/flutterSecureStore.dart';

class userModel extends ChangeNotifier {
  bool nameValide = false;
  bool surnameValide = false;
  bool patronymicValide = false;
  bool dobValide = false;
  bool genderValide = false;

  String name = "";
  String patronymic = "";
  String surname = "";
  String dob = "";
  int gender = -1;

  userModel() {
    _setup();
  }

  void _setup() {
    getUser();
    notifyListeners();
  }

  void getUser() async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: FluttSecureStorage.key);
    person user = await api.getProfile(token!);
    name = user.name;
    patronymic = user.patronymic;
    surname = user.surname;
    dob = user.birthday;
    gender = user.gender;
  }

  void putUser(String name, String surname, String patronymic, String dob,
      int gender) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: FluttSecureStorage.key);
    await api.putProfile(name, surname, patronymic, dob, gender, token!);
    _setup();
  }

  void setNameValide() {
    name.isNotEmpty ? nameValide = true : nameValide = false;
    notifyListeners();
  }

  void setSurnameValide() {
    surname.isNotEmpty ? surnameValide = true : surnameValide = false;
    notifyListeners();
  }

  void setPatronymicValide() {
    patronymic.isNotEmpty ? patronymicValide = true : patronymicValide = false;
    notifyListeners();
  }

  void setDobValide() {
    dob.isNotEmpty ? dobValide = true : dobValide = false;
    notifyListeners();
  }

  void setGenderValide() {
    gender != -1 ? genderValide = true : genderValide = false;
    notifyListeners();
  }
}
