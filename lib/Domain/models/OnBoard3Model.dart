import 'package:flutter/cupertino.dart';
import 'package:medic/Navigation/NavigatorClass.dart';

class OnBoard3Model {
  void goToMain(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.initPath);
  }
}
