import 'package:flutter/cupertino.dart';
import '../UI/PermanentUi/bottom_navigation.dart';
import '../UI/Authorized/create_card.dart';
import '../UI/Authorized/input_password.dart';
import '../main.dart';
import '../UI/Authorized/onboard.dart';
import '../UI/UserUi/oneOfferScreen.dart';
import '../UI/UserUi/patients_order.dart';
import '../UI/UserUi/paymentWidget.dart';
import '../UI/UserUi/result_screen.dart';
import '../UI/UserUi/support_screen.dart';
import '../UI/UserUi/user_screen.dart';

abstract class NavigatorPaths {
  static const initOnboard1Path = "/";
  static const initPath = "/auth";
  static const codePath = "/auth/inputCode";
  static const inputPassword = "/auth/inputCode/inputPassword";
  static const createCard = "/auth/inputCode/inputPassword/createCard";
  static const mainScreenCardPath =
      "/auth/inputCode/inputPassword/createCard/MainScreen";
  static const resultScreenCardPath =
      "/auth/inputCode/inputPassword/createCard/ResultScreen";
  static const supportScreenCardPath =
      "/auth/inputCode/inputPassword/createCard/SupportScreen";
  static const userScreenCardPath =
      "/auth/inputCode/inputPassword/createCard/UserScreen";
  static const formOfferPath =
      "/auth/inputCode/inputPassword/createCard/MainScreen/order";
  static const patientsOfferPath =
      "/auth/inputCode/inputPassword/createCard/MainScreen/order/patients";
  static const paymentPath =
      "/auth/inputCode/inputPassword/createCard/MainScreen/order/patients/payment";
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
