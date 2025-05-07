// coverage:ignore-file
import 'dart:ui';

import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';

enum HomeMetricsEnum {
  soja(Assets.soy, ThemeColors.kPrimary, 'soja'),
  milho(Assets.corn, ThemeColors.kPrimary, 'milho'),
  boiGordo(Assets.fatCattle, ThemeColors.kGreen, 'boi gordo'),
  vacaGorda(Assets.fatCow, ThemeColors.kGreen, 'vaca gorda');

  final String icon;
  final Color color;
  final String name;

  const HomeMetricsEnum(
    this.icon,
    this.color,
    this.name,
  );
}
