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

class BiometricUserErrorInfoPage extends StatefulWidget {
  const BiometricUserErrorInfoPage({super.key});

  @override
  State<BiometricUserErrorInfoPage> createState() =>
      _BiometricUserErrorInfoPageState();
}

class _BiometricUserErrorInfoPageState
    extends State<BiometricUserErrorInfoPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              minimumSize:
                  const WidgetStatePropertyAll(Size(double.infinity, 56)),
              textButton: tentarNovamente,
              action: () {
                Modular.to.pushNamed(Routes.proposalDetails);
              },
            ),
          ),
        ],
      ),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomSvgImage(
              assetName: Assets.success,
              width: ThemeSizes.w84,
              height: ThemeSizes.w84,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          Text(
            naoConseguimosRealizarAAssinatura,
            style: ThemeTypography.headline3,
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            naoFoiPossivelConcluirSuaAssinatura,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
