import 'package:flutter/material.dart';
import '../../UI/Authorized/input_email_code.dart';
import '../Api/Api.dart';

class firstWindowModel {
  String email = "";
  firstWindowModel() {
    _setup();
  }

  void _setup() {}

  void sendEmail(String email, BuildContext context) async {
    final api = Api();
    goToEmailCodeWidget(context, email);
    await api.sendEmail(email);
  }

  void goToEmailCodeWidget(BuildContext context, String email) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InputEmailCodeWidget(
              email: email,
            )));
  }
}
