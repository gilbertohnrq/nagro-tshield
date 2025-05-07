// coverage:ignore-file
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';

enum ButtonVariations {
  reject,
  accept,
  outlined,
  rejectOutlined,
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback? action;
  final String textButton;
  final WidgetStateProperty<Size?>? minimumSize;
  final WidgetStateProperty<Size?>? maximumSize;
  final bool? isLoading;
  final IconData? icon;
  final ButtonVariations variation;
  final double? iconSize;
  final AlignmentGeometry? titleAlignment;
  final Color? bgColor;
  final Color? txtColor;
  final double fontSize;
  final Color? border;
  final double? fontText;
  final FontWeight? fontWeight;

  const PrimaryButton({
    super.key,
    this.action,
    required this.textButton,
    this.minimumSize,
    this.maximumSize,
    this.isLoading = false,
    this.icon,
    this.variation = ButtonVariations.accept,
    this.iconSize = 24,
    this.titleAlignment = Alignment.center,
    this.bgColor,
    this.txtColor,
    this.fontSize = 16,
    this.border,
    this.fontText,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;

    final bool isDisabled = action == null || isLoading == true;

    switch (variation) {
      case ButtonVariations.accept:
        backgroundColor =
            ThemeColors.kPrimary.withValues(alpha: isDisabled ? 0 : 1);
        break;
      case ButtonVariations.reject:
        backgroundColor =
            ThemeColors.kDenied.withValues(alpha: isDisabled ? 0 : 1);
        break;
      case ButtonVariations.outlined:
        backgroundColor =
            ThemeColors.kAccent.withValues(alpha: isDisabled ? 0 : 1);
        break;
      case ButtonVariations.rejectOutlined:
        backgroundColor =
            ThemeColors.kAccent.withValues(alpha: isDisabled ? 0 : 1);
        break;
    }

    switch (variation) {
      case ButtonVariations.accept:
        borderColor =
            ThemeColors.kPrimary.withValues(alpha: isDisabled ? 0 : 1);
        break;
      case ButtonVariations.reject:
        borderColor = ThemeColors.kDenied.withValues(alpha: isDisabled ? 0 : 1);
        break;
      case ButtonVariations.outlined:
        borderColor =
            ThemeColors.kPrimary.withValues(alpha: isDisabled ? 0 : 1);
        break;
      case ButtonVariations.rejectOutlined:
        borderColor = ThemeColors.kDenied.withValues(alpha: isDisabled ? 0 : 1);
        break;
    }

    switch (variation) {
      case ButtonVariations.accept:
        textColor = ThemeColors.kAccent;
        break;
      case ButtonVariations.reject:
        textColor = ThemeColors.kAccent;
        break;
      case ButtonVariations.outlined:
        textColor = ThemeColors.kPrimary;
        break;
      case ButtonVariations.rejectOutlined:
        textColor = ThemeColors.kDenied;
        break;
    }

    return TextButton(
      onPressed: action,
      style: ButtonStyle(
        alignment: titleAlignment,
        minimumSize: minimumSize ??
            WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, ThemeSpacings.s56),
            ),
        maximumSize: maximumSize,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeRadius.r8),
            side: BorderSide(
              color: border ?? borderColor,
            ),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (bgColor != null) {
            return bgColor!;
          }
          if (states.contains(WidgetState.disabled) || isLoading == true) {
            return backgroundColor.withValues(alpha: 0.2);
          }
          return backgroundColor;
        }),
      ),
      child: isLoading == true
          ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
                color: ThemeColors.kPrimary,
              strokeWidth: 2,
              ),
          )
          : Row(
              mainAxisAlignment: icon != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                const SizedBox.shrink(),
                Text(
                  textButton,
                  style: ThemeTypography.button.copyWith(
                      color: txtColor ?? textColor,
                      fontSize: fontText,
                      fontWeight: fontWeight),
                  textAlign: TextAlign.center,
                ),
                if (icon != null)
                  Icon(
                    icon,
                    color: txtColor ?? textColor,
                    size: iconSize,
                  ),
              ],
            ),
    );
  }
}
