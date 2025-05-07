import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:flutter/material.dart';

class TextWheelLoading extends StatelessWidget {
  final List<String> texts;
  final ScrollController scrollController;
  final double itemWheelSize;
  final Map<String, IconData> statusIcons;
  final Map<String, Color> statusColors;

  const TextWheelLoading({
    super.key,
    required this.texts,
    required this.scrollController,
    required this.itemWheelSize,
    required this.statusIcons,
    required this.statusColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.kAccent,
      padding: const EdgeInsets.symmetric(horizontal: ThemeSpacings.s32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: itemWheelSize + ThemeSpacings.s10),
            child: SizedBox(
              height: itemWheelSize * 2,
              child: ListWheelScrollView(
                overAndUnderCenterOpacity: 0.2,
                diameterRatio: 100,
                squeeze: 1,
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                itemExtent: itemWheelSize,
                children: _buildWheelItems(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildWheelItems() {
    return [
      const SizedBox.shrink(),
      ...texts.map((text) {
        final bool isStatusDefined = statusIcons.containsKey(text);
        final IconData? iconData = isStatusDefined ? statusIcons[text] : null;
        final Color? iconColor = isStatusDefined ? statusColors[text] : null;

        return Row(
          children: [
            if (iconData != null) Icon(iconData, color: iconColor),
            if (iconData != null) const SizedBox(width: ThemeSpacings.s8),
            Text(
              text,
              style: ThemeTypography.sub2.copyWith(
                  color: iconColor ?? ThemeColors.kTextLight),
            ),
          ],
        );
      }),
    ];
  }
}
