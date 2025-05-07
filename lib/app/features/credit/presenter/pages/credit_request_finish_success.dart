import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreditRequestFinishSuccessPage extends StatefulWidget {
  const CreditRequestFinishSuccessPage({super.key});

  @override
  State<CreditRequestFinishSuccessPage> createState() =>
      _CreditRequestFinishSuccessPageState();
}

class _CreditRequestFinishSuccessPageState
    extends State<CreditRequestFinishSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              action: () {
                Modular.to.popAndPushNamed(Routes.home, result: true);
              },
              textButton: fechar,
            ),
          ),
        ],
      ),
      hasLeading: false,
      child: ListView(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: CustomSvgImage(assetName: Assets.scrInAnalysis),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          Text(
            suaSolicitacaoFoiEnviada,
            style: ThemeTypography.headline5,
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            suaSolicitacaoDeCreditoFoiEnviadaParaONossoTimeDeEspecialistas,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
