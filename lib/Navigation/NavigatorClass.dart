import 'package:flutter/cupertino.dart';
import '../UI/UserUi/MainScreen.dart';
import '../UI/PermanentUi/bottom_navigation.dart';
import '../UI/Authorized/create_card.dart';
import '../UI/Authorized/input_email_code.dart';
import '../UI/Authorized/input_password.dart';
import '../main.dart';
import '../UI/Authorized/onboard1.dart';
import '../UI/UserUi/oneOfferScreen.dart';
import '../UI/UserUi/patients_order.dart';
import '../UI/UserUi/paymentWidget.dart';
import '../UI/UserUi/result_screen.dart';
import '../UI/UserUi/support_screen.dart';
import '../UI/UserUi/user_screen.dart';

abstract class NavigatorPaths {
  static const initOnboard1Path = "onboard1";
  static const initPath = "onboard1/auth";
  static const codePath = "onboard1/auth/inputCode";
  static const inputPassword = "onboard1/auth/inputCode/inputPassword";
  static const createCard = "onboard1/auth/inputCode/inputPassword/createCard";
  static const mainScreenCardPath =
      "onboard1/auth/inputCode/inputPassword/createCard/MainScreen";
  static const resultScreenCardPath =
      "onboard1/auth/inputCode/inputPassword/createCard/ResultScreen";
  static const supportScreenCardPath =
      "onboard1/auth/inputCode/inputPassword/createCard/SupportScreen";
  static const userScreenCardPath =
      "onboard1/auth/inputCode/inputPassword/createCard/UserScreen";
  static const formOfferPath =
      "onboard1/auth/inputCode/inputPassword/createCard/MainScreen/order";
  static const patientsOfferPath =
      "onboard1/auth/inputCode/inputPassword/createCard/MainScreen/order/patients";
  static const paymentPath =
      "onboard1/auth/inputCode/inputPassword/createCard/MainScreen/order/patients/payment";
}

class NavigateService {
  String initialRoute = NavigatorPaths.initOnboard1Path;
  final routes = <String, Widget Function(BuildContext)>{
    NavigatorPaths.initOnboard1Path: (context) => const onboard1(),
    NavigatorPaths.initPath: (context) => const MyApp(),
    NavigatorPaths.inputPassword: (context) => InputPassword(),
    NavigatorPaths.createCard: (context) => CreateCard(),
    NavigatorPaths.mainScreenCardPath: (context) =>
        const BottomNavigationWidget(),
    NavigatorPaths.resultScreenCardPath: (context) => const ResultScreen(),
    NavigatorPaths.supportScreenCardPath: (context) => const SupportScreen(),
    NavigatorPaths.userScreenCardPath: (context) => const UserScreen(),
    NavigatorPaths.formOfferPath: (context) => const oneOfferScreen(),
    NavigatorPaths.patientsOfferPath: (context) => const patientsOrder(),
    NavigatorPaths.paymentPath: (context) => const paymentWidget(),
  };
}
