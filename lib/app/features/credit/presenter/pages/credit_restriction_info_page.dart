// coverage:ignore-file
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

class CreditRestrictionInfoPage extends StatelessWidget {
  const CreditRestrictionInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: voltar,
              action: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              sentimosMuitomasNaoSeraPossivelAtender,
              style: ThemeTypography.sub1,
            ),
            const SizedBox(height: ThemeSpacings.s40),
            Text(
              nesteMomentoNossaPoliticaDeCreditoNaoConsegueTeAtender,
              style: inputText1.copyWith(color: ThemeColors.kTextLight),
            ),
            const SizedBox(height: ThemeSpacings.s16),
            Text(
              casoVoeNaoPossuaRestricoesDeCredito,
              style: inputText1.copyWith(color: ThemeColors.kTextLight),
            ),
          ],
        ),
      ),
    );
  }
}
