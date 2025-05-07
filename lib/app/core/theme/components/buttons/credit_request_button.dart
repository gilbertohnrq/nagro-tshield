// coverage:ignore-file

import 'package:finan/app/core/enums/proposal_status_enum.dart';
import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:flutter/material.dart';

class CreditRequestButton extends StatelessWidget {
  final VoidCallback? action;
  final VoidCallback? tap;
  final String textButton;
  final String? subtextButton;
  final Gradient? color;
  final String image;
  final String? preApprovedValue;
  final String? centerText;
  final TextStyle textStyle;
  final Widget? additionalWidget;
  final double textScaler;

  CreditRequestButton.preApproved({
    super.key,
    this.action,
    this.tap,
    required this.textButton,
    required this.preApprovedValue,
    required this.image,
    this.color,
    this.subtextButton,
  })  : centerText = null,
        textScaler = 1.3,
        textStyle = ThemeTypography.body3.copyWith(
          color: ThemeColors.kAccent,
        ),
        additionalWidget = preApprovedValue != null
            ? Text(
                preApprovedValue,
                textScaler: const TextScaler.linear(1),
                style: ThemeTypography.headline5.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.kAccent,
                ),
                textAlign: TextAlign.start,
              )
            : null;

  CreditRequestButton.standard({
    super.key,
    this.action,
    this.tap,
    required this.textButton,
    required this.image,
    this.color,
    this.subtextButton,
  })  : preApprovedValue = null,
        centerText = null,
        textScaler = 1.0,
        textStyle = ThemeTypography.sub1.copyWith(
          fontWeight: FontWeight.w700,
          color: ThemeColors.kAccent,
        ),
        additionalWidget = null;

  CreditRequestButton.withCenterText({
    super.key,
    this.action,
    this.tap,
    required this.textButton,
    required this.image,
    required this.centerText,
    this.color,
    this.subtextButton,
  })  : preApprovedValue = null,
        textScaler = 1.0,
        textStyle = ThemeTypography.body3.copyWith(
          color: ThemeColors.kAccent,
          fontWeight: FontWeight.w500,
        ),
        additionalWidget = Text(
          centerText!,
          textScaler: const TextScaler.linear(1),
          style: ThemeTypography.sub1.copyWith(
            color: ThemeColors.kAccent,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.start,
        );

  @override
  Widget build(BuildContext context) {
    final callback = tap ?? action;

    return RepaintBoundary(
      child: InkWell(
        onTap: callback,
        child: Container(
          height: ThemeSizes.h108,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(ThemeRadius.r8)),
            gradient: color,
          ),
          child: Stack(
            children: [
              if (!ProposalStatusEnum.allAssets.contains(image))
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomSvgImage(
                      assetName: '${Assets.creditRequestButton}/$image',
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                  top: ThemeSpacings.s16,
                  bottom: ThemeSpacings.s16,
                  left: ThemeSpacings.s16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textButton,
                      textScaler: TextScaler.linear(textScaler),
                      style: textStyle,
                      textAlign: TextAlign.start,
                    ),
                    if (additionalWidget != null) additionalWidget!,
                    const Spacer(),
                    if (callback != null && subtextButton != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            subtextButton!,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            textScaler: const TextScaler.linear(1),
                            style: ThemeTypography.body3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.kAccent,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: ThemeSpacings.s8),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: ThemeColors.kAccent,
                          ),
                        ],
                      )
                    else
                      const Expanded(child: Row()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
