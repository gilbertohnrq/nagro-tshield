import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

class CreditRequestStepThreeInfoPage extends StatefulWidget {
  const CreditRequestStepThreeInfoPage({super.key});

  @override
  State<CreditRequestStepThreeInfoPage> createState() =>
      _CreditRequestStepThreeInfoPageState();
}

class _CreditRequestStepThreeInfoPageState
    extends State<CreditRequestStepThreeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      child: ListView(
        padding: const EdgeInsets.all(ThemeSpacings.s16),
        children: [
          Text(
            consultaAoScr,
            style: ThemeTypography.sub1,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          RichText(
            text: TextSpan(
              style: ThemeTypography.body3.copyWith(
                color: ThemeColors.kTextLight,
              ),
              children: [
                TextSpan(
                  text: section1,
                  style: ThemeTypography.body3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: sistemaDeInformacoesDeCreditoSCR),
                const TextSpan(text: text1),
                TextSpan(
                  text: section1_1,
                  style: ThemeTypography.body3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: text1_1),
                TextSpan(
                  text: section1_2,
                  style: ThemeTypography.body3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: text1_2),
                TextSpan(
                  text: section1_3,
                  style: ThemeTypography.body3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: text1_3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
