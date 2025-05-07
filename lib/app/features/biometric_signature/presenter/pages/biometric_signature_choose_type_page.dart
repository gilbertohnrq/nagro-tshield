import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_symbols_icons/symbols.dart';

class BiometricSignatureChooseTypePage extends StatefulWidget {
  final BiometricSignatureSendPhotoPageArguments biometricArguments;

  const BiometricSignatureChooseTypePage({
    super.key,
    required this.biometricArguments,
  });

  @override
  State<BiometricSignatureChooseTypePage> createState() =>
      BiometricSignatureChooseTypeState();
}

class BiometricSignatureChooseTypeState
    extends State<BiometricSignatureChooseTypePage> {
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      child: ListView(
        children: [
          Text(
            opcoesSemQrCode,
            style: ThemeTypography.headline4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            escolhaEntreAs2OpcoesAbaixo,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Text(
            selecioneAOpcao,
            style: ThemeTypography.body1.copyWith(
              fontWeight: FontWeight.w500,
              color: ThemeColors.kPrimary,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: ThemeSpacings.s24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ThemeRadius.r8),
              border: Border.all(width: 1, color: ThemeColors.kBorder),
            ),
            child: _buildListTile(
              foto,
              fotoDaFrenteDeSuaCnh,
              Icons.photo_camera_outlined,
              () {
                Modular.to.pushNamed(
                  'animation-cnh',
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
          ),
          Container(
            margin: const EdgeInsets.only(top: ThemeSpacings.s24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ThemeRadius.r8),
              border: Border.all(width: 1, color: ThemeColors.kBorder),
            ),
            child: _buildListTile(
                anexarPdf,
                facaOUploadDoPdfDaCnhExportadoDoAppCarteiraDigital,
                Icons.picture_as_pdf_outlined, () {
              Modular.to.pushNamed(
                'attach-file',
                arguments: BiometricSignatureSendPhotoPageArguments(
                  widget.biometricArguments.proposalResponse,
                  null,
                  null,
                  null,
                  widget.biometricArguments.fromPreApproved,
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  InkWell _buildListTile(
      String title, String subtitle, IconData icon, void Function()? function) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeSpacings.s16,
          horizontal: ThemeSpacings.s24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 32,
              color: ThemeColors.kPrimary,
            ),
            const SizedBox(width: ThemeSpacings.s16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ThemeTypography.body3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.kPrimary,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      subtitle,
                      style: ThemeTypography.body3.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.kTextLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Symbols.arrow_right_alt_rounded,
              color: ThemeColors.kPrimary,
            )
          ],
        ),
      ),
    );
  }
}
