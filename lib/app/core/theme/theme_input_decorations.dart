// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeDecorations {
  const ThemeDecorations._();

  static const _defaultRadius =
      BorderRadius.all(Radius.circular(ThemeRadius.r6));

  static InputDecorationTheme get inputDecorationTheme =>
      const InputDecorationTheme(
        labelStyle: TextStyle(color: ThemeColors.kTextLight),
        hintStyle: TextStyle(color: ThemeColors.kTextBase),
        iconColor: ThemeColors.kTextLight,
        contentPadding: EdgeInsets.symmetric(
          horizontal: ThemeSpacings.s12,
          vertical: ThemeSpacings.s14,
        ),
        border: OutlineInputBorder(
          borderRadius: _defaultRadius,
          borderSide: BorderSide(color: ThemeColors.kGrayEnabled),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: _defaultRadius,
          borderSide: BorderSide(color: ThemeColors.kGrayEnabled),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: _defaultRadius,
          borderSide: BorderSide(color: ThemeColors.kError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: _defaultRadius,
          borderSide: BorderSide(color: ThemeColors.kError),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: _defaultRadius,
          borderSide: BorderSide(color: ThemeColors.kPrimary),
        ),
      );
}
