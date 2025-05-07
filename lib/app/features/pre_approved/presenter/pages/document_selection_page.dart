import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/extensions/extensions.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/document_tips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DocumentSelectionPage extends StatefulWidget {
  const DocumentSelectionPage({super.key});

  static const route = 'document-selection';

  @override
  State<DocumentSelectionPage> createState() => _DocumentSelectionPageState();
}

class _DocumentSelectionPageState extends State<DocumentSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      actions: const [NeedHelpWhatsapp()],
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: 'Continuar',
              action: () {
                Modular.to.pushNamed(DocumentTipsPage.route);
              },
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Documento de identificação',
            style: ThemeTypography.headline5,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          Text(
            'Agora, precisamos que você capture uma foto da sua CNH ou RG para validarmos suas informações.',
            style:
                ThemeTypography.body2.copyWith(color: ThemeColors.kTextLight),
          ),
          const SizedBox(height: ThemeSpacings.s48),
          Text(
            'Escolha abaixo qual documento você deseja utilizar:',
            style: ThemeTypography.sub2.copyWith(
              color: ThemeColors.kPrimary,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s40),
          _DocumentOption(
            title: 'CNH',
            subtitle: 'Carteira de Habilitação',
            assetPath: Assets.cnhFrame,
            onTap: () {
              setState(() {});
            },
            isSelected: false,
          ),
          const SizedBox(height: ThemeSpacings.s16),
          _DocumentOption(
            title: 'RG',
            subtitle: 'Carteira de Identidade',
            assetPath: Assets.rgFrame,
            onTap: () {
              setState(() {});
            },
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class _DocumentOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetPath;
  final VoidCallback onTap;
  final bool isSelected;

  const _DocumentOption({
    required this.title,
    required this.subtitle,
    required this.assetPath,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? ThemeColors.kPrimary
                : ThemeColors.kTextLight.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: ThemeSpacings.s12,
                  top: ThemeSpacings.s12,
                  bottom: ThemeSpacings.s12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: ThemeTypography.body1.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      subtitle,
                      style: ThemeTypography.body3.copyWith(
                        color: ThemeColors.kTextLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                  width: 163.w,
                  height: 140.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
