// coverage:ignore-file
import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BiometricsInAnalysisScreen extends StatefulWidget {
  const BiometricsInAnalysisScreen({super.key});

  @override
  State<BiometricsInAnalysisScreen> createState() =>
      _BiometricsInAnalysisScreenState();
}

class _BiometricsInAnalysisScreenState
    extends State<BiometricsInAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              minimumSize: WidgetStateProperty.all(
                const Size(double.infinity, 56),
              ),
              textButton: fechar,
              action: () {
                Modular.to.pushNamedAndRemoveUntil(
                    Routes.start, (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                CustomSvgImage(
                  assetName: Assets.biometricsInValidation,
                  height: ThemeSizes.w272,
                  width: ThemeSizes.w272,
                ),
                const SizedBox(height: ThemeSpacings.s48),
                Text(
                  biometriaEmAnalise,
                  style: headline2.copyWith(
                    color: ThemeColors.kTextBase,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ThemeSpacings.s24),
                Text(
                  fiqueAtentoEmBreve,
                  style: ThemeTypography.body1.copyWith(
                    color: ThemeColors.kTextLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
