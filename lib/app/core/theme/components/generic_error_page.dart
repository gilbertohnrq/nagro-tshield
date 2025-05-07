// coverage:ignore-file
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

class GenericErrorPage extends StatefulWidget {
  final void Function()? action;
  const GenericErrorPage({this.action, super.key});

  @override
  State<GenericErrorPage> createState() => GenericErrorPageState();
}

class GenericErrorPageState extends State<GenericErrorPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
              child: PrimaryButton(
            minimumSize:
                const WidgetStatePropertyAll(Size(double.infinity, 56)),
            textButton: widget.action != null ? tentarNovamente : fechar,
            action: () {
              if (widget.action != null) {
                widget.action!();
              } else {
                Modular.to.navigate(Routes.home);
              }
            },
          )),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CustomSvgImage(
              assetName: Assets.genericError,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          Text(
            opsAlgoDeuErrado,
            style:
                ThemeTypography.headline3.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            desculpeOcorreuUmErroInesperado,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
