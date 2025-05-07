import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProposalSignDeniedScreen extends StatefulWidget {
  const ProposalSignDeniedScreen({super.key});

  @override
  State<ProposalSignDeniedScreen> createState() =>
      _ProposalSignDeniedScreenState();
}

class _ProposalSignDeniedScreenState extends State<ProposalSignDeniedScreen> {
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
              textButton: 'Fechar',
              action: () {
                Modular.to.popUntil((route) => false);
              },
            ),
          ),
        ],
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        direction: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              bottom: ThemeSpacings.s16,
            ),
            child: CustomSvgImage(
              assetName: Assets.signDenied,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: ThemeSpacings.s32,
              bottom: ThemeSpacings.s24,
            ),
            child: Text(
              analisamosSuaSolicitacaoNoEntanto,
              textAlign: TextAlign.center,
              style: ThemeTypography.body1.copyWith(
                color: ThemeColors.kTextLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
