import 'dart:io';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:finan/app/features/biometric_signature/presenter/components/qrcode_overlay_component.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_input_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:path_provider/path_provider.dart';

class BiometricSignatureQRCodeScannerPage extends StatefulWidget {
  final BiometricSignatureSendPhotoPageArguments biometricArguments;

  static final route = 'qrcode-scanner';

  const BiometricSignatureQRCodeScannerPage(
      {super.key, required this.biometricArguments});

  @override
  State<BiometricSignatureQRCodeScannerPage> createState() =>
      BiometricSignatureQRCodeScannerState();
}

class BiometricSignatureQRCodeScannerState
    extends State<BiometricSignatureQRCodeScannerPage> {
  late final Uint8List? image;

  final MobileScannerController cameraController = MobileScannerController(
    formats: <BarcodeFormat>[BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Stack(
      children: [
        MobileScanner(
          controller: cameraController,
          onDetect: (BarcodeCapture capture) async {
            final List<Barcode> barcodes = capture.barcodes;
            image = capture.image;
            for (final Barcode barcode in barcodes) {
              if (barcode.rawBytes != null && barcode.rawBytes!.length > 200) {
                final Directory test = await getTemporaryDirectory();
                final File file = File('${test.path}/cnh.bin');
                await file.writeAsBytes(barcode.rawBytes!, flush: true);

                Modular.to.pushNamed(PreApprovedInputAddressPage.route);
              }
            }
          },
        ),
        Container(
          height: statusBarHeight,
          color: ThemeColors.kPrimary,
        ),
        Positioned.fill(
          top: statusBarHeight + ThemeSpacings.s24,
          left: ThemeSpacings.s32,
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back,
                    color: ThemeColors.kAccent,
                    size: 24,
                  ),
                  onTap: () {
                    Modular.to.pop();
                  },
                ),
                const SizedBox(width: ThemeSpacings.s16),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  child: AutoSizeText(
                    aponteSuaCameraParaOQrCode,
                    maxLines: 1,
                    style: ThemeTypography.body1.copyWith(
                      color: ThemeColors.kAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: QRScannerOverlayComponent(
              overlayColour:
                  const Color.fromARGB(255, 199, 64, 64).withValues(alpha: 0.5),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeSpacings.s32,
                vertical: ThemeSpacings.s24,
              ),
              color: Colors.black.withValues(alpha: 0.6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suaCnhNaoPossuiQrCode,
                    style: ThemeTypography.body2.copyWith(
                      color: ThemeColors.kAccent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: ThemeSpacings.s16),
                  PrimaryButton(
                    textButton: opcoesSemQrCode,
                    icon: Icons.more_horiz,
                    variation: ButtonVariations.outlined,
                    txtColor: ThemeColors.kAccent,
                    bgColor: Colors.transparent,
                    border: ThemeColors.kAccent,
                    action: () {
                      Modular.to.pushReplacementNamed(
                        'choose-type',
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
        ),
      ],
    );
  }
}
