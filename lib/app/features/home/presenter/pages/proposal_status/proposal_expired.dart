import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

class ProposalExpiredScreen extends StatefulWidget {
  const ProposalExpiredScreen({super.key});

  @override
  State<ProposalExpiredScreen> createState() => _ProposalExpiredScreenState();
}

class _ProposalExpiredScreenState extends State<ProposalExpiredScreen> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ThemeSpacings.s24),
        child: PrimaryButton(
          textButton: reativarProposta,
          action: () async {},
        ),
      ),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomSvgImage(
              assetName: Assets.expiredProposal,
              width: ThemeSizes.w84,
              height: ThemeSizes.w84,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          Text(
            propostaExpirada,
            style: ThemeTypography.headline3.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            oPrazoParaAssinaturaDaSuaPropostaDeCreditoExpirou,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
