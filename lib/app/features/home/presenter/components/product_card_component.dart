// coverage:ignore-file

import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_shadows.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback? action;
  final VoidCallback? tap;
  final String textButton;
  final Gradient? color;
  final String image;
  final TextStyle? textStyle;
  final bool isCreditRequest;
  final bool isNews;

  const ProductCard(
      {super.key,
      this.action,
      this.tap,
      required this.textButton,
      required this.image,
      this.color,
      this.textStyle,
      this.isCreditRequest = false,
      this.isNews = false});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ThemeSizes.w96,
      width: ThemeSizes.w96,
      child: Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: action,
                child: Container(
                  height: ThemeSizes.w92,
                  width: ThemeSizes.w92,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(ThemeRadius.r8)),
                      gradient: color,
                      color: color == null ? Colors.white : null,
                      boxShadow: ThemeShadows.md),
                  child: Stack(
                    children: [
                      if (isCreditRequest)
                        Positioned(
                          left: ThemeSpacings.sMinus40,
                          top: ThemeSpacings.sMinus12,
                          child: CustomSvgImage(
                            width: ThemeSizes.w70,
                            height: ThemeSizes.w70,
                            assetName: image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (!isCreditRequest)
                        Positioned.fill(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(ThemeSpacings.s8),
                            child: CustomSvgImage(
                                assetName: image,
                                colorFilter: const ColorFilter.mode(
                                  ThemeColors.kPrimary600,
                                  BlendMode.srcIn,
                                )),
                          ),
                        ),
                      Positioned.fill(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(ThemeSpacings.s8),
                          child: Text(
                            textButton,
                            style: textStyle ??
                                ThemeTypography.body3.copyWith(
                                    color: ThemeColors.kTextLight,
                                    fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isNews)
            Positioned(
              right: ThemeSpacings.s0,
              top: ThemeSpacings.s6,
              child: Container(
                height: ThemeSizes.h15,
                width: ThemeSizes.w35,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: ThemeColors.kPrimary600,
                  borderRadius:
                      BorderRadius.all(Radius.circular(ThemeRadius.r2)),
                ),
                child: Text(
                  novo,
                  style: ThemeTypography.body3.copyWith(
                      fontSize: ThemeSizes.sp10, color: ThemeColors.kAccent),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
