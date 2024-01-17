import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medic/Navigation/NavigatorClass.dart';
import '../Api/Api.dart';
import '../flutterSecureStorage/flutterSecureStore.dart';

class emailCodePasswordModel {
  String recoveryCode = "";

  emailCodePasswordModel() {}

  void sendRecoveryCode(
      String email, String recoveryCode, BuildContext context) async {
    goToInputCode(context);
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await api.sendRecoveryCode(email, recoveryCode);
    await storage.write(key: FluttSecureStorage.key, value: token);
    goToInputCode(context);
  }

  void goToInputCode(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.inputPassword);
  }
}
