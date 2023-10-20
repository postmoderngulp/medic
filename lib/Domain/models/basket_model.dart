import 'package:flutter/cupertino.dart';
import 'package:medic/Navigation/NavigatorClass.dart';

class subBasketModel {
  void goToBasket(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.formOfferPath);
  }
}
