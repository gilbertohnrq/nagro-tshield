// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class NagroFloatingDock extends StatelessWidget {
  final bool isVisible;
  final List<Widget> children;
  final Color? backgroundColor;

  const NagroFloatingDock({
    super.key,
    this.isVisible = true,
    required this.children,
    this.backgroundColor = ThemeColors.kAccent,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return const SizedBox(height: 0);
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(
        ThemeSpacings.s32,
        ThemeSpacings.s6,
        ThemeSpacings.s32,
        ThemeSpacings.s32,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        children: children,
      ),
    );
  }
}
