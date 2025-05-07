import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorComponent extends StatelessWidget {
  final Animation<double> animation;
  final String text;

 const ProgressIndicatorComponent({
    super.key,
    required this.animation,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 125,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeSpacings.s32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(
              color: ThemeColors.kPrimary,
              value: animation.value,
              minHeight: ThemeSizes.h8,
              backgroundColor: ThemeColors.kBorder,
              valueColor: const AlwaysStoppedAnimation(ThemeColors.kPrimary),
            ),
            const SizedBox(height: ThemeSpacings.s24),
            Text(
              text,
              style: ThemeTypography.body2.copyWith(
                color: ThemeColors.kTextLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
