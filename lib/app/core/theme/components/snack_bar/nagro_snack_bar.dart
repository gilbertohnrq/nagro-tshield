// coverage:ignore-file
//coverage:ignore-file

import 'package:dio/dio.dart';
import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

enum NagroSnackbarStatus { success, info, error, warning }

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

class NagroSnackbar {
  static final NagroSnackbar _instance = NagroSnackbar._internal();

  factory NagroSnackbar() {
    return _instance;
  }

  NagroSnackbar._internal();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? show({
    String? title,
    required String text,
    required NagroSnackbarStatus status,
    void Function()? onVisible,
    int seconds = 5,
    SnackBarAction? action,
    double marginBottom = 0.0,
  }) {
    Color? bgColor;
    String? iconPath;
    Color? iconColor;

    switch (status) {
      case NagroSnackbarStatus.success:
        bgColor = ThemeColors.kSuccessBg;
        iconColor = ThemeColors.kSuccess;
        iconPath = Assets.snackbarSuccess;
        break;
      case NagroSnackbarStatus.info:
        bgColor = ThemeColors.kInfoBg;
        iconColor = ThemeColors.kInfo;
        iconPath = Assets.snackbarInfo;
        break;
      case NagroSnackbarStatus.warning:
        bgColor = ThemeColors.kWarningBg;
        iconColor = ThemeColors.kWarning;
        iconPath = Assets.snackbarWarning;
        break;
      case NagroSnackbarStatus.error:
        bgColor = ThemeColors.kAlertErrorBg;
        iconColor = ThemeColors.kAlertError;
        iconPath = Assets.snackbarError;
        break;
    }

    if (snackbarKey.currentState != null) {
      return snackbarKey.currentState!.showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeRadius.r6),
          ),
          backgroundColor: bgColor,
          content: Row(
            children: [
              Container(
                height: ThemeSizes.w48,
                width: ThemeSizes.w48,
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: ThemeSizes.w32,
                    width: ThemeSizes.w32,
                    decoration: const BoxDecoration(
                      color: ThemeColors.kAccent,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox.square(
                      dimension: 19,
                      child: CustomSvgImage(
                        assetName: iconPath,
                        fit: BoxFit.scaleDown,
                        colorFilter:
                            ColorFilter.mode(iconColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: ThemeSpacings.s24),
                  child: Column(
                    children: [
                      if (title != null)
                        Text(
                          title,
                          style: ThemeTypography.sub2.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ThemeColors.kTextLight,
                          ),
                          softWrap: true,
                        ),
                      Text(
                        text,
                        style: ThemeTypography.body3.copyWith(
                          color: ThemeColors.kTextLight,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => snackbarKey.currentState!.hideCurrentSnackBar(),
                child: const Icon(
                  Icons.close,
                  color: ThemeColors.kTextLight,
                  size: 24,
                ),
              ),
            ],
          ),
          onVisible: onVisible,
          action: action,
          duration: Duration(seconds: seconds),
          behavior: SnackBarBehavior.floating,
          padding: const EdgeInsets.all(ThemeSpacings.s16),
          margin: EdgeInsets.only(
            left: ThemeSpacings.s24,
            top: ThemeSpacings.s16,
            right: ThemeSpacings.s24,
            bottom: ThemeSpacings.s16 + marginBottom,
          ),
          elevation: 0,
        ),
      );
    } else {
      return null;
    }
  }

  static String processError(DioException? error) {
    var errorMap = <String, dynamic>{};
    final int statusCode = error?.response?.statusCode ?? 500;
    if (statusCode == 503) {
      errorMap.addAll({"message": servicoIndisponivel});
    } else {
      errorMap = error?.response?.data ?? {} as Map<String, dynamic>;
    }
    return errorMap['message'] ?? 'An error occurred';
  }

  static void showApiError(
    DioException? err,
    SnackBar? snackBar,
    BuildContext context,
  ) {
    FocusScope.of(context).unfocus();

    final messenger = ScaffoldMessenger.maybeOf(context);

    if (messenger != null) {
      if (snackBar == null) {
        messenger.showSnackBar(SnackBar(content: Text(processError(err))));
      } else {
        messenger.showSnackBar(snackBar);
      }
    } else {}
  }

  static void showInformation(
    String info, {
    SnackBar? snackBar,
    required BuildContext context,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);

    if (messenger != null) {
      if (snackBar == null) {
        messenger.showSnackBar(SnackBar(content: Text(info)));
      } else {
        messenger.showSnackBar(snackBar);
      }
    } else {
      debugPrint('ScaffoldMessenger not available.');
    }
  }
}
