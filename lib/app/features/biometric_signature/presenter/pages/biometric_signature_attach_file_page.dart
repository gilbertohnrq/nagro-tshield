import 'dart:io';

import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/page_arguments/biometric_signature_page_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BiometricSignatureAttachFilePage extends StatefulWidget {
  final BiometricSignatureSendPhotoPageArguments biometricArguments;

  const BiometricSignatureAttachFilePage({
    super.key,
    required this.biometricArguments,
  });

  @override
  State<BiometricSignatureAttachFilePage> createState() =>
      BiometricSignatureAttachFileState();
}

class BiometricSignatureAttachFileState
    extends State<BiometricSignatureAttachFilePage> {
  File? attachFile;

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<void> _onContinue() async {}

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      backgroundColor: ThemeColors.kPrimary,
      hasAppbar: false,
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: continuar,
              action: _onContinue,
            ),
          )
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: ThemeColors.kAccent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: ThemeSpacings.s32),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Modular.to.pop();
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back,
                  size: ThemeSpacings.s24,
                ),
              ),
            ),
            const SizedBox(height: ThemeSpacings.s24),
            Text(
              anexarPdf,
              style: ThemeTypography.body1.copyWith(
                  fontWeight: FontWeight.w500, color: ThemeColors.kPrimary),
            ),
            Container(
              margin: const EdgeInsets.only(top: ThemeSpacings.s16),
              child: RichText(
                text: TextSpan(
                  style: ThemeTypography.body1.copyWith(
                    color: ThemeColors.kTextLight,
                  ),
                  children: const [
                    TextSpan(
                      text: paraAnexarSua,
                    ),
                    TextSpan(
                      text: cnhE,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: sigaOsSeguintesPassosAbaixo,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: ThemeSpacings.s24),
                  child: Row(
                    children: [
                      Text(
                        um,
                        style: ThemeTypography.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.kPrimary,
                        ),
                      ),
                      const SizedBox(width: ThemeSpacings.s16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: RichText(
                          text: TextSpan(
                            style: ThemeTypography.sub2.copyWith(
                              color: ThemeColors.kPrimary,
                              fontWeight: FontWeight.w400,
                            ),
                            children: const [
                              TextSpan(text: baixeOApp),
                              TextSpan(
                                text: carteiraDigital,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: pela,
                              ),
                              TextSpan(
                                text: playStore,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: ThemeSpacings.s16),
                  child: Row(
                    children: [
                      Text(
                        dois,
                        style: ThemeTypography.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.kPrimary,
                        ),
                      ),
                      const SizedBox(width: ThemeSpacings.s16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: RichText(
                          text: TextSpan(
                            style: ThemeTypography.sub2.copyWith(
                              color: ThemeColors.kPrimary,
                              fontWeight: FontWeight.w400,
                            ),
                            children: const [
                              TextSpan(
                                text: selecione,
                              ),
                              TextSpan(
                                text: condutor,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: naTelaInicial,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: ThemeSpacings.s20),
                  child: Row(
                    children: [
                      Text(
                        tres,
                        style: ThemeTypography.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.kPrimary,
                        ),
                      ),
                      const SizedBox(width: ThemeSpacings.s16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: ThemeSizes.sp14,
                                fontWeight: FontWeight.w400,
                                color: ThemeColors.kPrimary),
                            children: [
                              const TextSpan(
                                text: toqueEm,
                              ),
                              const TextSpan(
                                text: acessarCnhE,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: ThemeSpacings.s20),
                  child: Row(
                    children: [
                      Text(
                        quatro,
                        style: ThemeTypography.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.kPrimary,
                        ),
                      ),
                      const SizedBox(width: ThemeSpacings.s16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: RichText(
                          text: TextSpan(
                            style: ThemeTypography.sub2.copyWith(
                              color: ThemeColors.kPrimary,
                              fontWeight: FontWeight.w400,
                            ),
                            children: const [
                              TextSpan(
                                text: toqueEm,
                              ),
                              TextSpan(
                                text: exportar,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: paraBaixarOPdfDaCnhE,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: ThemeSpacings.s20),
                  child: Row(
                    children: [
                      Text(
                        cinco,
                        style: ThemeTypography.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.kPrimary,
                        ),
                      ),
                      const SizedBox(width: ThemeSpacings.s16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: RichText(
                          text: TextSpan(
                            style: ThemeTypography.sub2.copyWith(
                              color: ThemeColors.kPrimary,
                              fontWeight: FontWeight.w400,
                            ),
                            children: const [
                              TextSpan(
                                text: anexeOPdfAbaixoTocandoEm,
                              ),
                              TextSpan(
                                text: '$anexarPdf.',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: ThemeSpacings.s40),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      anexo,
                      style: ThemeTypography.sub2.copyWith(
                        color: ThemeColors.kTextLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: ThemeSpacings.s8),
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: ThemeSpacings.s24,
                        vertical: ThemeSpacings.s16,
                      ),
                      height: ThemeSizes.h120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ThemeRadius.r4),
                        border: Border.all(
                          width: 1,
                          color: ThemeColors.kBorder,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: ThemeSpacings.s24,
                            vertical: ThemeSpacings.s16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          nenhumAnexo,
                          style: TextStyle(
                              fontSize: ThemeSizes.sp12,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.kGray500),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
