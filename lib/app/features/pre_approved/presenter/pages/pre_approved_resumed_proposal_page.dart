import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/nagro_radio_row.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreApprovedResumedProposalPage extends StatefulWidget {
  const PreApprovedResumedProposalPage({super.key});

  @override
  State<PreApprovedResumedProposalPage> createState() =>
      _PreApprovedResumedProposalPageState();
}

class _PreApprovedResumedProposalPageState
    extends State<PreApprovedResumedProposalPage> {
  int? _selectedOption;

  void _onRadioChanged(Object? value) {
    setState(() {
      _selectedOption = value as int?;
    });

    if (_selectedOption == 1) {
      Modular.to.pushNamed(Routes.notConfirmedPage);
    }
  }

  void _onPrimaryButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: contrateAgora,
              action: _onPrimaryButtonPressed,
            ),
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const UserGreeting(),
            CNHRadioSelector(
              onRadioChanged: _onRadioChanged,
              selectedOption: _selectedOption,
            ),
          ],
        ),
      ),
    );
  }
}

class UserGreeting extends StatelessWidget {
  const UserGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: ola,
            style: ThemeTypography.headline5.copyWith(
              color: ThemeColors.kTextLight,
              fontWeight: FontWeight.w400,
            ),
            children: [
              const TextSpan(
                text: 'Fulano de Tal',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ThemeSpacings.s8),
        Text(
          parabensVocePossuiPreAprovadoNoValor,
          style: inputText1.copyWith(
            color: ThemeColors.kTextLight,
          ),
        ),
        const SizedBox(height: ThemeSpacings.s24),
        Text(
          'R\$ 1000,00',
          style: ThemeTypography.headline2.copyWith(
            color: ThemeColors.kTextBase,
          ),
        ),
        const SizedBox(height: ThemeSpacings.s24),
        RichText(
          text: TextSpan(
            text: voceTemAOpcaoDeEscolherEntre,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
            children: const [
              TextSpan(
                text: QntParcelas,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: paraEfetuarOPagamentoAproveiteEContrate,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CNHRadioSelector extends StatelessWidget {
  final ValueChanged<int?> onRadioChanged;
  final int? selectedOption;

  const CNHRadioSelector({
    super.key,
    required this.onRadioChanged,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: ThemeSpacings.s32),
        Text(
          esteCreditoEExclusivoParaPessoasCNHOuRG,
          style: inputText1.copyWith(
            color: ThemeColors.kTextLight,
          ),
        ),
        const SizedBox(height: ThemeSpacings.s48),
        Text(
          vocePossuiCnhOuRg,
          style: ThemeTypography.body2,
        ),
        const SizedBox(height: ThemeSpacings.s16),
        NagroRadioRow<int>(
          items: [
            RadioFormItemModel(
              label: 'Sim',
              value: 0,
              onChanged: (value) => onRadioChanged(value as int?),
            ),
            RadioFormItemModel(
              label: 'Não',
              value: 1,
              onChanged: (value) => onRadioChanged(value as int?),
            ),
          ],
          groupValue: selectedOption,
          isValid: true,
        ),
      ],
    );
  }
}
