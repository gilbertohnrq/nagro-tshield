import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_radius.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_symbols_icons/symbols.dart';

enum BiometricSignatureTips {
  retireODocumento(retireODocumentoDoPlastico, Symbols.id_card),
  posicioneODocumento(posicioneODocumentoSobreAMesa, Symbols.brightness_5),
  aponteACameraPara(
      aponteACameraParaOQRCodeEAguardeALeitura, Symbols.qr_code_scanner);

  const BiometricSignatureTips(this.text, this.icon);

  final String text;
  final IconData icon;
}

class BiometricSignatureQRCodeScannerInfoPage extends StatefulWidget {
  final BiometricSignatureSendPhotoPageArguments biometricArguments;

  const BiometricSignatureQRCodeScannerInfoPage(
      {super.key, required this.biometricArguments});

  @override
  State<BiometricSignatureQRCodeScannerInfoPage> createState() =>
      _BiometricSignatureQRCodeScannerInfoPageState();
}

class _BiometricSignatureQRCodeScannerInfoPageState
    extends State<BiometricSignatureQRCodeScannerInfoPage> {
  final permissionService = Modular.get<IPermissionService>();
  final bcImage = Image.asset(Assets.qrcodeInfo);

  Future<void> onBack() async {
    final int popCount =
        await permissionService.isCameraPermissionGranted() ? 2 : 3;

    for (int i = 0; i < popCount; i++) {
      Modular.to.pop();
    }
  }

  @override
  void didChangeDependencies() {
    precacheImage(bcImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: continuar,
              action: () {
                Modular.to.pushNamed(
                  Routes.qrCodeAnimation,
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
          )
        ],
      ),
      hasLeading: true,
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back,
          color: ThemeColors.kTextBase,
        ),
        onTap: () {
          onBack();
        },
      ),
      child: ListView(
        children: [
          Text(
            carteiraDeHabilitacaoCNH,
            style: ThemeTypography.headline5,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Image(
            image: bcImage.image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          const SizedBox(height: ThemeSpacings.s56),
          Text(
            dicasPasso2,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s40),
          Text(
            escanearQRCodeCNH,
            style: ThemeTypography.sub2.copyWith(
              color: ThemeColors.kPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          ...BiometricSignatureTips.values.map(
            (tip) {
              return Padding(
                padding: const EdgeInsets.only(top: ThemeSpacings.s40),
                child: Row(
                  children: [
                    Container(
                      height: ThemeSizes.w56,
                      width: ThemeSizes.w56,
                      decoration: BoxDecoration(
                        color: ThemeColors.kPrimary50,
                        borderRadius: BorderRadius.circular(ThemeRadius.r50),
                      ),
                      child: Icon(
                        tip.icon,
                        color: ThemeColors.kPrimary,
                        size: 32,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: ThemeSpacings.s16),
                        child: Text(
                          tip.text,
                          style: ThemeTypography.body3.copyWith(
                            color: ThemeColors.kTextLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
