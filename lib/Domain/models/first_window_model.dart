import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Navigation/NavigatorClass.dart';
import '../../UI/Authorized/input_email_code.dart';
import '../Api/Api.dart';

class firstWindowModel {
  String email = "";
  firstWindowModel() {
    _setup();
  }

  void _setup() {}

  void sendEmail(String email, BuildContext context) async {
    goToEmailCodeWidget(context, email);
    final api = Api();
    await api.sendEmail(email);
  }

  void goToEmailCodeWidget(BuildContext context, String email) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InputEmailCodeWidget(
              email: email,
            )));
  }
}
