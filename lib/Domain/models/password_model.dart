import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../Navigation/NavigatorClass.dart';

class passwordModel {
  String password = '';

  void goToCreateCard(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.createCard);
  }

  void SavePassword(String password, BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'password', value: password);
    goToCreateCard(context);
  }
}
