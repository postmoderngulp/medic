import 'package:flutter/material.dart';
import 'package:medic/style/colorrs.dart';

abstract class TexxtStyle {
  static TextStyle title =
      const TextStyle(fontFamily: "SanFranciscoHeavy", fontSize: 24);
  static TextStyle subTitle =
      const TextStyle(fontFamily: "SanFranciscoRegular", fontSize: 15);
  static TextStyle subSubTitle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 15, color: colorrs.subGreyy);
  static TextStyle subSubredTitle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 15, color: Colors.red);
  static TextStyle blackSubTitle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 15, color: Colors.black);
  static TextStyle subAnalyseText = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 12, color: Colors.black);
  static TextStyle SubsubSubTitle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 14, color: colorrs.subGreyy);
  static TextStyle SubsubSubTitleBlue = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 14, color: colorrs.accent);
  static TextStyle buttonStyleWhite = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 17, color: Colors.white);
  static TextStyle buttonStyleW = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 15, color: Colors.white);
  static TextStyle buttonStyleAccent = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 15, color: colorrs.accent);
  static TextStyle buttonStyleBlack = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 17, color: Colors.black);
  static TextStyle placeHolderSTyle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 15, color: colorrs.subGreyy);
  static TextStyle placeHolderBlackSTyle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 15, color: Colors.black);
  static TextStyle followingTxtStyle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 15, color: colorrs.accent);
  static TextStyle bankTxtStyle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 16, color: colorrs.subGreyy);
  static TextStyle bankTxtStyleWhite = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 16, color: Colors.white);
  static TextStyle regBlackStyle = const TextStyle(
      fontFamily: "SanFranciscoRegular", fontSize: 16, color: Colors.black);
  static TextStyle mainSubText = const TextStyle(
      fontFamily: "SanFranciscoSemiBold",
      fontSize: 17,
      color: colorrs.subGreyy);
  static TextStyle chipSelectText = const TextStyle(
      fontFamily: "SanFranciscoMedium", fontSize: 15, color: Colors.white);
  static TextStyle chipUnSelectText = const TextStyle(
      fontFamily: "SanFranciscoMedium", fontSize: 15, color: colorrs.subGreyy);
  static TextStyle promoText = const TextStyle(
      fontFamily: "SanFranciscoMedium", fontSize: 15, color: colorrs.subGreyy);
  static TextStyle HeadlineMedium = const TextStyle(
      fontFamily: "SanFranciscoMedium", fontSize: 16, color: Colors.black);
  static TextStyle headlineText = const TextStyle(
      fontFamily: "SanFranciscoMedium", fontSize: 16, color: colorrs.subGreyy);
  static TextStyle priceElementText = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 17, color: Colors.black);
  static TextStyle Caption = const TextStyle(
      fontFamily: "SanFranciscoSemiBold",
      fontSize: 14,
      color: colorrs.subGreyy);
  static TextStyle buttonElementText = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 12, color: Colors.white);
  static TextStyle buttonElementTextblue = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 12, color: colorrs.accent);
  static TextStyle title2Text = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 20, color: Colors.black);
  static TextStyle buttonPaswordText = const TextStyle(
      fontFamily: "SanFranciscoSemiBold", fontSize: 24, color: Colors.black);
  static TextStyle textMedium = const TextStyle(
      fontFamily: "SanFranciscoMedium", fontSize: 15, color: Colors.black);
  static TextStyle textLato = const TextStyle(
      fontFamily: "SanFranciscoLato", fontSize: 20, color: colorrs.green);
}
