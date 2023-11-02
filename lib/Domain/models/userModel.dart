import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/Domain/Api/Api.dart';
import 'package:medic/Domain/entity/person.dart';
import '../flutterSecureStorage/flutterSecureStore.dart';

class userModel extends ChangeNotifier {
  bool nameValide = false;
  bool surnameValide = false;
  bool patronymicValide = false;
  bool dobValide = false;
  bool genderValide = false;

  bool avatarValide = false;

  File? avatar;
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

  Future pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    avatar = image?.path == null && avatar?.path != null
        ? avatar
        : File("${image?.path}");
    setAvatarValide(avatar);
    notifyListeners();
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

  void setAvatarValide(File? image) {
    if (image == avatar || image == null) return;
    avatar = image;
    avatarValide = true;
    notifyListeners();
  }

  void loadAvatar(File? image) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: FluttSecureStorage.key);
    avatarValide = false;
    notifyListeners();
    await api.loadicon(token!, image);
  }
}
