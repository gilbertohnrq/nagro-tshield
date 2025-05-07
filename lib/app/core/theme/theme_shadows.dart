// coverage:ignore-file
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeShadows {
  ThemeShadows._();

  static const md = [
    BoxShadow(
      color: ThemeColors.kDivider,
      offset: Offset(0, 4),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];
}
