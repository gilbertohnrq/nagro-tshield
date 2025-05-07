// coverage:ignore-file
import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WhyTrustNagroBanner extends StatelessWidget {
  const WhyTrustNagroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to
            .pushNamed(Routes.aboutNagro, arguments: externalResourcesByVideo);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: ThemeSpacings.s24),
        padding: const EdgeInsets.symmetric(horizontal: ThemeSpacings.s16),
        height: ThemeSizes.h50,
        decoration: BoxDecoration(
          color: ThemeColors.kBackground,
          borderRadius: BorderRadius.circular(ThemeRadius.r6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSvgImage(
                  assetName: Assets.blueLogo,
                  height: ThemeSizes.h11,
                ),
                const SizedBox(width: ThemeSpacings.s16),
                Text(
                  porqueDevoConfiar,
                  style: bodyText4.copyWith(
                      color: ThemeColors.kTextBase,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: ThemeColors.kTextLight,
              size: ThemeSpacings.s12,
            )
          ],
        ),
      ),
    );
  }
}
