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

class BiometricUnexpectedErrorInfoPage extends StatefulWidget {
  const BiometricUnexpectedErrorInfoPage({super.key});

  @override
  State<BiometricUnexpectedErrorInfoPage> createState() =>
      _BiometricUnexpectedErrorInfoPageState();
}

class _BiometricUnexpectedErrorInfoPageState
    extends State<BiometricUnexpectedErrorInfoPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  minimumSize:
                      const WidgetStatePropertyAll(Size(double.infinity, 56)),
                  textButton: tentarNovamente,
                  action: () {
                    Modular.to.pushNamed(Routes.proposalDetails);
                  },
                ),
                const SizedBox(height: ThemeSpacings.s24),
                PrimaryButton(
                  variation: ButtonVariations.outlined,
                  minimumSize:
                      const WidgetStatePropertyAll(Size(double.infinity, 56)),
                  textButton: falarComOSuporte,
                  action: () {
                    Modular.to.pushNamed(Routes.help);
                  },
                )
              ],
            ),
          ),
        ],
      ),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomSvgImage(
              assetName: Assets.alert,
              width: ThemeSizes.w84,
              height: ThemeSizes.w84,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          Text(
            ocorreuUmErroInesperado,
            style: ThemeTypography.headline3,
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            houveUmaProblemaAoProcessarSuaAssinatura,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
