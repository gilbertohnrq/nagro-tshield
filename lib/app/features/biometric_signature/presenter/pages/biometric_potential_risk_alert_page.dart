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

class BiometricRiskAlertPage extends StatefulWidget {
  const BiometricRiskAlertPage({super.key});

  @override
  State<BiometricRiskAlertPage> createState() => _BiometricRiskAlertPageState();
}

class _BiometricRiskAlertPageState extends State<BiometricRiskAlertPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
              child: PrimaryButton(
            minimumSize:
                const WidgetStatePropertyAll(Size(double.infinity, 56)),
            textButton: fechar,
            action: () {
              Modular.to.navigate(Routes.home);
            },
          )),
        ],
      ),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CustomSvgImage(
              assetName: Assets.riskAlert,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          Text(
            naoPodemosContinuarComAAssinatura,
            style: ThemeTypography.headline4.copyWith(
                fontSize: ThemeSizes.sp22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            validamosQueEstaSendoUtilizadoAlgumaPropriedadeOfensora,
            style: ThemeTypography.body2.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          Container(
            alignment: Alignment.center,
            height: ThemeSizes.h44,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
                horizontal: ThemeSpacings.s16, vertical: ThemeSpacings.s10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ThemeRadius.r8),
                color: ThemeColors.kBackground),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  contatoNagroEmail,
                  style: ThemeTypography.body1.copyWith(
                      color: ThemeColors.kPrimary, fontWeight: FontWeight.w600),
                ),
                const Icon(
                  Icons.email_outlined,
                  color: ThemeColors.kPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
