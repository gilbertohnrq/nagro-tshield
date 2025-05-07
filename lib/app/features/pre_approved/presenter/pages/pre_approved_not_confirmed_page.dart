// coverage:ignore-file
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreApprovedNotConfirmedPage extends StatelessWidget {
  const PreApprovedNotConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: voltar,
              action: () => Modular.to.pop(),
            ),
          ),
        ],
      ),
      child: ListView(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: necessarioCnh,
                  style: ThemeTypography.sub1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: sadFace,
                  style: ThemeTypography.sub1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s40),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: creditoPreAprovadoExclusivo,
                  style: ThemeTypography.body1.copyWith(
                    color: ThemeColors.kTextLight,
                  ),
                ),
                TextSpan(
                  text: carteiraHabilitacao,
                  style: ThemeTypography.body1.copyWith(
                    color: ThemeColors.kPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: ponto,
                  style: ThemeTypography.body1.copyWith(
                    color: ThemeColors.kPrimary,
                  ),
                ),
                TextSpan(
                  text: dadosCnhIndispensaveis,
                  style: ThemeTypography.body1.copyWith(
                    color: ThemeColors.kTextLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            informarCnhSim,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
        ],
      ),
    );
  }
}
