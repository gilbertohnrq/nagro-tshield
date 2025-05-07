import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:flutter/material.dart';

mixin KeyboardHelper {
  static bool isKeyboardOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  static Widget addSpacingWhenKeyboardIsOpen(context) =>
      KeyboardHelper.isKeyboardOpen(context)
          ? const SizedBox(height: ThemeSpacings.s239)
          : const SizedBox(height: ThemeSpacings.s16);
}
