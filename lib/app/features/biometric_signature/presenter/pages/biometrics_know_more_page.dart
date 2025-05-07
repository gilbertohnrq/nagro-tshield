import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BiometricsKnowMorePage extends StatefulWidget {
  const BiometricsKnowMorePage({super.key});

  @override
  State<BiometricsKnowMorePage> createState() => _BiometricsKnowMorePageState();
}

class _BiometricsKnowMorePageState extends State<BiometricsKnowMorePage> {
  final permissionService = Modular.get<IPermissionService>();

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back,
          color: ThemeColors.kTextBase,
          size: 24,
        ),
        onTap: () {
          Modular.to.pop();
          Modular.to.pop();
        },
      ),
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: irParaAsConfiguracoes,
              action: () async {
                await permissionService.goToSettings();
              },
            ),
          )
        ],
      ),
      child: ListView(
        children: [
          Text(
            permissoes,
            style: ThemeTypography.headline4.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s24),
          const Text(paraConfigurarAsPermissoesSolicitadas),
          const SizedBox(height: ThemeSpacings.s48),
          const ListItem(
            index: 1,
            text: procurePeloAplicativoNagro,
          ),
          ListItem(
            index: 2,
            children: [
              const TextSpan(
                text: dentroDasInformacoes,
              ),
              TextSpan(
                text: permissoesPonto,
                style: ThemeTypography.body2.copyWith(
                  color: ThemeColors.kPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          ListItem(
            index: 3,
            children: [
              const TextSpan(
                text: habiliteAPermissao,
              ),
              TextSpan(
                text: localizacaoPonto,
                style: ThemeTypography.body2.copyWith(
                  color: ThemeColors.kPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          ListItem(
            index: 4,
            children: [
              const TextSpan(
                text: seAsPermissoesDe,
              ),
              TextSpan(
                text: cameraUpper,
                style: ThemeTypography.body2.copyWith(
                  color: ThemeColors.kPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: e,
              ),
              TextSpan(
                text: notificacao,
                style: ThemeTypography.body2.copyWith(
                  color: ThemeColors.kPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: estiveremDesabilitadas,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    this.text,
    this.children,
    required this.index,
  });

  final String? text;
  final List<InlineSpan>? children;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ThemeSpacings.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$index.',
            style: ThemeTypography.headline5.copyWith(
              fontWeight: FontWeight.w700,
              color: ThemeColors.kPrimary,
            ),
          ),
          const SizedBox(width: ThemeSpacings.s16),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: text,
                children: children,
              ),
              style: ThemeTypography.body2.copyWith(
                color: ThemeColors.kPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
