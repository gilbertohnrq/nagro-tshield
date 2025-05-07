// coverage:ignore-file
import 'package:auto_size_text/auto_size_text.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NagroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NagroAppBar({
    super.key,
    this.actions,
    this.onTap,
    this.hasLeading = true,
    this.leading,
    this.title,
    this.appBarColor,
    this.textStyle,
  });

  final List<Widget>? actions;
  final bool hasLeading;
  final Function()? onTap;
  final Widget? leading;
  final String? title;
  final Color? appBarColor;
  final TextStyle? textStyle;

  @override
  Size get preferredSize => const Size.fromHeight(72.0);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Container(
      color: appBarColor,
      child: Column(
        children: [
          Container(
            height: statusBarHeight.h,
            color: ThemeColors.kPrimary,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSpacings.s32,
            ),
            child: Row(
              children: [
                hasLeading
                    ? leading ??
                        GestureDetector(
                          onTap: onTap ??
                              () {
                                Modular.to.pop();
                              },
                          child: const Icon(
                            Icons.arrow_back,
                            color: ThemeColors.kTextBase,
                            size: 24,
                          ),
                        )
                    : const SizedBox.shrink(),
                const SizedBox(width: ThemeSpacings.s16),
                if (title != null) ...[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.65,
                    ),
                    child: AutoSizeText(
                      title!,
                      style: textStyle ??
                          ThemeTypography.headline5.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
                const Spacer(),
                if (actions != null) ...actions!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
