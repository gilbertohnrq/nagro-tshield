// coverage:ignore-file
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/pre_approved/presenter/components/reduce_valeu_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ReduceValueBottom extends StatelessWidget {
  final String grossAmount;
  const ReduceValueBottom({
    super.key,
    required this.grossAmount,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      minimumSize: const WidgetStatePropertyAll(
          Size(ThemeSpacings.s128, ThemeSpacings.s40)),
      textButton: reduzirValor,
      bgColor: Colors.white,
      txtColor: ThemeColors.kPrimary,
      border: ThemeColors.kPrimary,
      fontText: ThemeSpacings.s13,
      fontWeight: FontWeight.normal,
      action: () => _showReducerValueBottomSheet(context),
    );
  }

  void _showReducerValueBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ReduceValueBottomSheet(
            grossAmount: grossAmount,
          ),
        );
      },
    );
  }
}
