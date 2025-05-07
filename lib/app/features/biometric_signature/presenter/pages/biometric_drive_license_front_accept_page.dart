import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:finan/app/features/biometric_signature/presenter/components/hole_painter_cnh_front.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DriveLicenseFrontAcceptPage extends StatefulWidget {
  final BiometricSignatureSendPhotoPageArguments biometricArguments;

  const DriveLicenseFrontAcceptPage({
    super.key,
    required this.biometricArguments,
  });

  @override
  State<DriveLicenseFrontAcceptPage> createState() =>
      _DriveLicenseFrontAcceptPageState();
}

class _DriveLicenseFrontAcceptPageState
    extends State<DriveLicenseFrontAcceptPage> {
  @override
  Widget build(context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: CustomPaint(
                painter: HolePainterCnhFront(context: context),
                child: Container(),
              ),
            ),
          ),
          _AppBar(
            statusBarHeight: statusBarHeight,
          ),
          Positioned.fill(
            top: statusBarHeight + 56,
            right: ThemeSizes.w32,
            left: ThemeSizes.w32,
            child: Text(
              verifiqueSeAFotoEstaEmBoaQualidade,
              textAlign: TextAlign.center,
              style: ThemeTypography.body2.copyWith(
                color: ThemeColors.kAccent,
              ),
            ),
          ),
          Positioned.fill(
            bottom: ThemeSizes.h32,
            left: ThemeSizes.w32,
            right: ThemeSizes.w32,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    variation: ButtonVariations.outlined,
                    bgColor: Colors.transparent,
                    txtColor: ThemeColors.kAccent,
                    border: ThemeColors.kAccent,
                    minimumSize: WidgetStateProperty.all(
                      Size(ThemeSizes.w155, ThemeSizes.h56),
                    ),
                    action: () {
                      Navigator.of(context).pop();
                    },
                    textButton: alterar,
                  ),
                  SizedBox(width: ThemeSizes.w16),
                  PrimaryButton(
                    textButton: aceitar,
                    minimumSize: WidgetStateProperty.all(
                      Size(ThemeSizes.w155, ThemeSizes.h56),
                    ),
                    action: () {
                      Modular.to.popAndPushNamed(
                        "proposal/sign",
                        arguments: BiometricSignatureSendPhotoPageArguments(
                          widget.biometricArguments.proposalResponse,
                          null,
                          null,
                          null,
                          widget.biometricArguments.fromPreApproved,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.statusBarHeight,
  });

  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: statusBarHeight,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: ThemeSpacings.s24,
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: ThemeColors.kAccent,
                ),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
              Text(
                confirmeSuaFoto,
                style: ThemeTypography.sub1.copyWith(
                  color: ThemeColors.kAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
