// coverage:ignore-file

import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_border_size.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CotationCard extends StatelessWidget {
  const CotationCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.unit,
    required this.location,
    required this.iconColor,
    required this.maxLocationHeight,
  });

  final String title;
  final String value;
  final String icon;
  final String unit;
  final String location;
  final Color iconColor;
  final double maxLocationHeight;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3590,
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSpacings.s12,
        vertical: ThemeSpacings.s8,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: ThemeColors.kAccent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: ThemeBorderSize.s1,
            color: ThemeColors.kBorder,
          ),
          borderRadius: BorderRadius.circular(ThemeRadius.r8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  icon,
                  width: ThemeSizes.w20,
                  height: ThemeSizes.w20,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: ThemeSpacings.s4),
                Text(
                  unit,
                  textAlign: TextAlign.center,
                  style: ThemeTypography.body3.copyWith(
                    color: ThemeColors.kTextLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s10),
          Text(
            title,
            textAlign: TextAlign.left,
            style: ThemeTypography.body3.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.left,
            style: ThemeTypography.sub2,
          ),
          const SizedBox(height: ThemeSpacings.s4),
          SizedBox(
            height: maxLocationHeight,
            child: Opacity(
              opacity: 0.60,
              child: Text(
                location,
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ThemeTypography.body3.copyWith(
                  fontSize: 10,
                  color: ThemeColors.kTextLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
