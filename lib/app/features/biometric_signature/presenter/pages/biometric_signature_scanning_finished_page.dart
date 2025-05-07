import 'dart:async';

import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BiometricSignatureScanningFinishedPage extends StatefulWidget {
  final BiometricSignatureSendPhotoPageArguments biometricArguments;

  const BiometricSignatureScanningFinishedPage({
    super.key,
    required this.biometricArguments,
  });

  @override
  State<BiometricSignatureScanningFinishedPage> createState() =>
      _BiometricSignatureScanningFinishedPageState();
}

class _BiometricSignatureScanningFinishedPageState
    extends State<BiometricSignatureScanningFinishedPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<Timer> startTime() async {
    const Duration duration = Duration(seconds: 3);
    return Timer(
      duration,
      () => Modular.to.pushReplacementNamed(
        "/biometry/qrcode-info",
        arguments: BiometricSignatureSendPhotoPageArguments(
          widget.biometricArguments.proposalResponse,
          null,
          null,
          null,
          widget.biometricArguments.fromPreApproved,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: BoxDecoration(
                  color: ThemeColors.kTextBlack.withValues(alpha: 0.6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvgImage(
                      assetName: Assets.check,
                      height: ThemeSizes.w78,
                      width: ThemeSizes.w78,
                    ),
                    const SizedBox(height: ThemeSpacings.s20),
                    Text(
                      oEscaneamentoFacialFoiConcluido,
                      textAlign: TextAlign.center,
                      style: ThemeTypography.sub1.copyWith(
                        color: ThemeColors.kAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
