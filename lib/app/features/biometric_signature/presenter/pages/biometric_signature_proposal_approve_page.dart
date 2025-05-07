import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiometricSignatureProposalApprovePage extends StatefulWidget {
  const BiometricSignatureProposalApprovePage({super.key});

  @override
  State<BiometricSignatureProposalApprovePage> createState() =>
      _BiometricSignatureProposalApprovePageState();
}

class _BiometricSignatureProposalApprovePageState
    extends State<BiometricSignatureProposalApprovePage> {
  final formatCurrency =
      NumberFormat.currency(locale: "pt_BR", name: "BRL", symbol: "");

  final percent = NumberFormat.decimalPatternDigits(decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  minimumSize: WidgetStateProperty.all(
                    const Size(double.infinity, 56),
                  ),
                  textButton: aceitarProposta,
                  icon: Icons.check_circle_outline,
                  action: () async {},
                ),
                const SizedBox(height: ThemeSpacings.s16),
                PrimaryButton(
                  textButton: recusarProposta,
                  variation: ButtonVariations.rejectOutlined,
                  icon: Icons.cancel_outlined,
                  action: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      appBarTitle: condicoesDaOperacao,
      child: AnimatedSwitcher(
        duration: kTransitionDuration,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              color: ThemeColors.kBackground,
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeSpacings.s12,
                vertical: ThemeSpacings.s8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    propostaValida,
                    style: ThemeTypography.body2.copyWith(
                      color: ThemeColors.kTextLight,
                    ),
                  ),
                  Text(
                    '',
                    style: ThemeTypography.body2.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ThemeSpacings.s12),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    titleAlignment: Alignment.centerLeft,
                    minimumSize: WidgetStateProperty.all(
                      const Size(double.infinity, 29),
                    ),
                    iconSize: 18,
                    action: () {},
                    textButton: contrato,
                    icon: Icons.text_snippet_outlined,
                    variation: ButtonVariations.outlined,
                  ),
                ),
                const SizedBox(width: ThemeSpacings.s16),
                Expanded(
                  child: PrimaryButton(
                    titleAlignment: Alignment.centerLeft,
                    minimumSize: WidgetStateProperty.all(
                      const Size(double.infinity, 29),
                    ),
                    iconSize: 18,
                    action: () {},
                    textButton: detalhes,
                    icon: Icons.arrow_forward,
                    variation: ButtonVariations.outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeSpacings.s24),
            RichText(
              softWrap: true,
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: ThemeTypography.headline3.copyWith(
                  color: ThemeColors.kPrimary,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  const TextSpan(
                    text: '',
                  ),
                  TextSpan(
                    text: ' de ',
                    style: ThemeTypography.sub1.copyWith(
                      color: ThemeColors.kTextBlack,
                    ),
                  ),
                  const TextSpan(
                    text: '',
                  )
                ],
              ),
            ),
            const SizedBox(height: ThemeSpacings.s24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ConditionsValue(
                  label: valorAprovado,
                  value: '',
                ),
                SizedBox(width: ThemeSpacings.s24),
                _ConditionsValue(
                  label: valorFinanciado,
                  value: '',
                ),
              ],
            ),
            const SizedBox(height: ThemeSpacings.s16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ConditionsValue(
                  label: iof,
                  value: '',
                ),
                SizedBox(width: ThemeSpacings.s24),
                _ConditionsValue(
                  label: taxaDeCadastro,
                  value: '',
                ),
              ],
            ),
            const SizedBox(height: ThemeSpacings.s16),
            const Divider(),
            const SizedBox(height: ThemeSpacings.s16),
            Text(
              suaPrimeiraParcelaEm,
              style: ThemeTypography.body1,
            ),
            const SizedBox(height: ThemeSpacings.s16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ThemeSizes.w150,
                  child: Text(
                    '',
                    style: ThemeTypography.headline5.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: ThemeSpacings.s16),
                const _ConditionsValue(
                  label: carencia,
                  value: '',
                ),
              ],
            ),
            const SizedBox(height: ThemeSpacings.s16),
            const Divider(),
            const SizedBox(height: ThemeSpacings.s16),
            Text(taxas, style: ThemeTypography.body1),
            const SizedBox(height: ThemeSpacings.s16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ThemeSizes.w150,
                  child: const _ConditionsValue(
                    label: jurosAM,
                    value: '',
                  ),
                ),
                const SizedBox(width: ThemeSpacings.s24),
                const _ConditionsValue(
                  label: cetAM,
                  value: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ConditionsValue extends StatelessWidget {
  const _ConditionsValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: ThemeTypography.body2.copyWith(
            color: ThemeColors.kTextLight,
          ),
        ),
        Text(value, style: ThemeTypography.sub1),
      ],
    );
  }
}
