// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/core/theme/components/buttons/nagro_radio.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_radius.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:flutter/material.dart';

class NagroRadioRow<T> extends StatelessWidget {
  final List<RadioFormItemModel> items;
  final T? groupValue;
  final bool isValid;
  final bool disabled;
  final EdgeInsets padding;
  final double? height;
  final double? width;
  final TextStyle? labelStyle;

  const NagroRadioRow({
    super.key,
    required this.items,
    required this.groupValue,
    this.isValid = true,
    this.disabled = false,
    this.padding = EdgeInsets.zero,
    this.height,
    this.width,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: Opacity(
        opacity: disabled ? 0.3 : 1,
        child: Row(
          children: items.map((item) {
            return Container(
              margin: const EdgeInsets.only(right: ThemeSpacings.s24),
              child: InkWell(
                onTap: () => item.onChanged(item.value),
                borderRadius: BorderRadius.circular(ThemeRadius.r10),
                child: Padding(
                  padding: padding,
                  child: Row(
                    children: [
                      SizedBox(
                        height: height ?? 20,
                        width: width ?? 20,
                        child: NagroRadio<T>(
                          value: item.value as T,
                          groupValue: groupValue,
                          onChanged: item.onChanged,
                          activeColor: ThemeColors.kPrimary,
                          unselectColor: ThemeColors.kPrimary,
                        ),
                      ),
                      const SizedBox(width: ThemeSpacings.s2),
                      Text(
                        item.label,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ThemeColors.kTextLight,
                          fontSize: ThemeSizes.sp16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class RadioFormItemModel {
  final String label;
  final dynamic value;
  final void Function(Object?) onChanged;

  RadioFormItemModel({
    required this.label,
    required this.value,
    required this.onChanged,
  });
}
