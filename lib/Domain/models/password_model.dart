import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Navigation/NavigatorClass.dart';

class passwordModel {
  void goToCreateCard(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.createCard);
  }
}
