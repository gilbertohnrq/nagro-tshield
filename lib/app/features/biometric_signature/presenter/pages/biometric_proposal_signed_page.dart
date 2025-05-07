// coverage:ignore-file
import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProposalSignedPage extends StatefulWidget {
  const ProposalSignedPage({super.key});

  @override
  State<ProposalSignedPage> createState() => _ProposalSignedPageState();
}

class _ProposalSignedPageState extends State<ProposalSignedPage> {
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
              textButton: 'Fechar',
              action: () {
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
            child: CustomSvgImage(assetName: Assets.signatureSuccess),
          ),
          Text(
            assinaturaFeitaComSucesso,
            style: ThemeTypography.headline4.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Text(
            emBreveSeuCreditoEstaraDisponivel,
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
