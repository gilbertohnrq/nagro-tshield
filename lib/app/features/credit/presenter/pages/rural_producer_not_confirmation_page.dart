// coverage:ignore-file
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RuralProducerNotConfirmationPage extends StatelessWidget {
  const RuralProducerNotConfirmationPage({super.key});

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
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: ThemeColors.kTextBase,
                fontSize: ThemeSizes.sp18,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                const TextSpan(
                  text: creditoSomenteProdutorRural,
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s40),
          Text(
            creditoNagroExclusivo,
            style: TextStyle(
              color: ThemeColors.kTextLight,
              fontSize: ThemeSizes.sp16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
