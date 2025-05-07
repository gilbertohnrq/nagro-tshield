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

class BiometricsInAnalysisPage extends StatefulWidget {
  const BiometricsInAnalysisPage({super.key});

  @override
  State<BiometricsInAnalysisPage> createState() =>
      _BiometricsInAnalysisPageState();
}

class _BiometricsInAnalysisPageState extends State<BiometricsInAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              minimumSize: const WidgetStatePropertyAll(
                Size(double.infinity, 56),
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
      child: ListView(
        children: [
          SizedBox(height: ThemeSizes.h32),
          const SizedBox.square(
            dimension: 272,
            child: CustomSvgImage(assetName: Assets.biometricsInAnalysis),
          ),
          Text(
            biometriaEmAnalise,
            style: ThemeTypography.headline4.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Text(
            fiqueAtentoEmBreveVoceSeraNotificadoComORetornoDaAnalise,
            textAlign: TextAlign.center,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
