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

class ProposalSignCanceledPage extends StatefulWidget {
  const ProposalSignCanceledPage({super.key});

  @override
  State<ProposalSignCanceledPage> createState() =>
      _ProposalSignCanceledPageState();
}

class _ProposalSignCanceledPageState extends State<ProposalSignCanceledPage> {
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
              textButton: saibaMais,
              action: () async {
                Navigator.of(context).pushNamed(Routes.knowMore);
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
            child: CustomSvgImage(assetName: Assets.signCanceled),
          ),
          Text(
            assinaturaCancelada,
            style: ThemeTypography.headline4.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Text(
            precisamosDaSuaPermissaoParaAcessarALocalizacao,
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
