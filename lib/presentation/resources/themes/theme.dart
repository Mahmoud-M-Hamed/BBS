import 'package:bbs/application/constants/constants.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/resources/styles/fonts/font_manager.dart';
import 'package:bbs/presentation/resources/styles/styles/styles_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get applicationTheme => ThemeData(
        // ----------------------------------<main Colors>----------------------------------------

        primaryColor: ColorsManager.kPrimaryColor,
        scaffoldBackgroundColor: ColorsManager.kWhiteColor,

        // ----------------------------------<appBar Theme>----------------------------------------

        appBarTheme: AppBarTheme(
          color: ColorsManager.kPrimaryColor,
          titleTextStyle:
              StylesManager.boldStyle(color: ColorsManager.kWhiteColor),
          elevation: AppConstants.appBarElevation,
        ),

        // ----------------------------------<Button Theme>------------------------------------------------

        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(
              EdgeInsets.all(SpacePaddingManager.p16),
            ),
          ),
        ),

        // ----------------------------------<TextField Theme>------------------------------------------------

        // ----------------------------------<Text Theme>------------------------------------------------

        textTheme: TextTheme(
          displayLarge: StylesManager.boldStyle(
              color: ColorsManager.kBlackColor, fontSize: FontSizeManager.s22),
          displayMedium: StylesManager.boldStyle(
              color: ColorsManager.kBlackColor, fontSize: FontSizeManager.s18),
          displaySmall: StylesManager.boldStyle(
              color: ColorsManager.kWhiteColor, fontSize: FontSizeManager.s14),
          labelLarge: StylesManager.mediumStyle(
              color: ColorsManager.kBlackColor, fontSize: FontSizeManager.s22),
          labelMedium: StylesManager.mediumStyle(
              color: ColorsManager.kBlackColor, fontSize: FontSizeManager.s16),
          labelSmall: StylesManager.mediumStyle(
              color: ColorsManager.kBlueAccent, fontSize: FontSizeManager.s12),
          bodyLarge: StylesManager.regularStyle(
              color: ColorsManager.kBlackColor, fontSize: FontSizeManager.s22),
          bodyMedium: StylesManager.regularStyle(
              color: ColorsManager.kBlackColor, fontSize: FontSizeManager.s18),
          bodySmall: StylesManager.regularStyle(
              color: ColorsManager.kWhiteColor, fontSize: FontSizeManager.s12),
        ),
      );
}
