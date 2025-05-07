// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';

class NagroListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets? contentPadding;
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final Widget? subtitle;
  final ShapeBorder? shape;
  final double? leadingGap;
  final double? bodyGap;
  final double? titleGap;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? color;
  final bool alignLeadingWithTitle;

  const NagroListTile({
    super.key,
    this.onTap,
    this.contentPadding,
    this.leading,
    this.trailing,
    this.title,
    this.subtitle,
    this.shape,
    this.leadingGap = ThemeSpacings.s12,
    this.bodyGap = ThemeSpacings.s24,
    this.titleGap,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.color = ThemeColors.kAccent,
    this.alignLeadingWithTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    late final textTheme = Theme.of(context).textTheme;

    return Material(
      color: color,
      shape: shape,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: contentPadding ??
              const EdgeInsets.only(
                left: ThemeSpacings.s8,
                top: ThemeSpacings.s8,
                right: ThemeSpacings.s12,
                bottom: ThemeSpacings.s8,
              ),
          child: Row(
            crossAxisAlignment: alignLeadingWithTitle
                ? CrossAxisAlignment.start
                : crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leading != null) ...[
                leading!,
                SizedBox(width: leadingGap),
              ],
              if (title != null || subtitle != null)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        DefaultTextStyle(
                            style: textTheme.titleMedium!, child: title!),
                      if (subtitle != null) ...[
                        SizedBox(height: titleGap),
                        DefaultTextStyle(
                          style: textTheme.bodyMedium!
                              .copyWith(color: ThemeColors.kTextBase),
                          child: subtitle!,
                        ),
                      ]
                    ],
                  ),
                ),
              if (trailing != null) ...[
                SizedBox(width: bodyGap),
                trailing!,
              ]
            ],
          ),
        ),
      ),
    );
  }
}
