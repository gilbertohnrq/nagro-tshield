// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:flutter/material.dart';

class HelpOptionComponent extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String label;

  const HelpOptionComponent({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            height: ThemeSizes.h96,
            imagePath,
            alignment: Alignment.centerLeft,
          ),
        ),
        const SizedBox(height: ThemeSpacings.s4),
        Text(
          label,
          style: ThemeTypography.body2.copyWith(
            fontWeight: FontWeight.w500,
            color: ThemeColors.kTextBase,
          ),
        ),
      ],
    );
  }
}
