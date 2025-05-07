// coverage:ignore-file
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

class BannerKnowMore extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onButtonPressed;

  const BannerKnowMore({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: ThemeSpacings.s24,
        right: ThemeSpacings.s24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon,
                      size: ThemeSpacings.s20, color: ThemeColors.kAccent),
                  const SizedBox(width: ThemeSpacings.s8),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      style: ThemeTypography.sub1.copyWith(
                        fontSize: ThemeSizes.sp16,
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.kAccent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ThemeSpacings.s8),
              Text(
                description,
                style: ThemeTypography.body3.copyWith(
                  color: ThemeColors.kAccent,
                ),
              ),
            ],
          ),
          PrimaryButton(
            action: onButtonPressed,
            textButton: saibaMais,
            bgColor: Colors.transparent,
            txtColor: ThemeColors.kAccent,
            fontSize: ThemeSizes.sp14,
            border: ThemeColors.kAccent,
            icon: Icons.arrow_forward,
            minimumSize: const WidgetStatePropertyAll(
              Size(ThemeSpacings.s151, ThemeSpacings.s42),
            ),
            maximumSize: const WidgetStatePropertyAll(
              Size(ThemeSpacings.s151, ThemeSpacings.s42),
            ),
            iconSize: ThemeSpacings.s18,
          ),
        ],
      ),
    );
  }
}
