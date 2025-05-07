// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

TextStyle headline1 = const TextStyle(
  fontFamily: fontFamily,
  fontSize: 30,
  fontWeight: FontWeight.normal,
  color: ThemeColors.kTextBlack,
);

TextStyle headline2 = const TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 24,
  fontFamily: fontFamily,
  color: ThemeColors.kPrimary,
);

TextStyle headline3 = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    fontFamily: fontFamily,
    color: ThemeColors.kGray100);

TextStyle bodyText2 = const TextStyle(
  height: 1,
  fontFamily: fontFamily,
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
  color: ThemeColors.kTextBlack,
);

TextStyle bodyText3 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: fontFamily,
    color: ThemeColors.kGray100);

TextStyle bodyText4 = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    fontFamily: fontFamily,
    color: ThemeColors.kPrimary);

TextStyle inputText1 = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: fontFamily,
    color: ThemeColors.kCloseGray);

class ThemeTypography {
  const ThemeTypography._();

  static TextTheme get textTheme => TextTheme(
        headlineLarge: headline1,
        headlineMedium: headline2,
        headlineSmall: headline3,
        titleMedium: sub1,
        titleSmall: sub2,
        bodyLarge: body1,
        bodyMedium: body2,
        bodySmall: body3,
      ).apply(fontFamily: 'Poppins', bodyColor: ThemeColors.kTextBase);

  static TextStyle get headline1 => TextStyle(
        fontSize: ThemeSizes.sp48,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
      );

  static TextStyle get headline2 => TextStyle(
        fontSize: ThemeSizes.sp36,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      );

  static TextStyle get headline3 => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      );

  static TextStyle get headline4 => const TextStyle(
        fontSize: 24,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get headline5 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      );

  static TextStyle get sub1 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      );

  static TextStyle get sub2 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      );

  static TextStyle get body1 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      );

  static TextStyle get body2 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      );

  static TextStyle get body3 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      );

  static TextStyle get body4 => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      );

  static TextStyle get button => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: ThemeColors.kAccent,
      );

  static TextStyle get input1 => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 110,
        height: 1.05,
        fontWeight: FontWeight.w300,
        color: ThemeColors.kTextBlack,
      );
}
