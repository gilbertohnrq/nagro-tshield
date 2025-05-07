import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProposalSignDeniedPage extends StatefulWidget {
  const ProposalSignDeniedPage({super.key});

  @override
  State<ProposalSignDeniedPage> createState() => _ProposalSignDeniedPageState();
}

class _ProposalSignDeniedPageState extends State<ProposalSignDeniedPage> {
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
              action: () async {
                Modular.to.popUntil((route) => false);
              },
            ),
          ),
        ],
      ),
      child: ListView(
        children: [
          const SizedBox(height: ThemeSpacings.s32),
          const SizedBox.square(
            dimension: 272,
            child: CustomSvgImage(assetName: Assets.signDenied),
          ),
          Text(
            propostaNegada,
            style: ThemeTypography.headline4.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Text(
            analisamosASuaSolicitacaoENeste,
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
