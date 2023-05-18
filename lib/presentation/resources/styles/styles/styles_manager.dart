import 'package:bbs/presentation/resources/styles/fonts/font_manager.dart';
import 'package:flutter/material.dart';

class StylesManager {
  static TextStyle _getTextStyle({
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
  }) =>
      TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);

  static TextStyle boldStyle({
    required Color color,
    double fontSize = FontSizeManager.s18,
  }) =>
      _getTextStyle(
          color: color,
          fontWeight: FontWeightManager.kBoldFont,
          fontSize: fontSize);

  static TextStyle mediumStyle(
          {required Color color, double fontSize = FontSizeManager.s14}) =>
      _getTextStyle(
          color: color,
          fontWeight: FontWeightManager.kMediumFont,
          fontSize: fontSize);

  static TextStyle regularStyle(
          {required Color color, double fontSize = FontSizeManager.s14}) =>
      _getTextStyle(
          color: color,
          fontWeight: FontWeightManager.kRegularFont,
          fontSize: fontSize);
}
