// coverage:ignore-file
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

enum ReasonsRefuse {
  limiteLiberado,
  valorDaParcela,
  numeroDeParcelas,
  outros,
}

extension ReasonRefuseExtension on ReasonsRefuse {
  String get label {
    switch (this) {
      case ReasonsRefuse.limiteLiberado:
        return limiteLiberado;
      case ReasonsRefuse.valorDaParcela:
        return valorDaParcela;
      case ReasonsRefuse.numeroDeParcelas:
        return numeroDeParcelas;
      case ReasonsRefuse.outros:
        return outros;
    }
  }

  String get name {
    switch (this) {
      case ReasonsRefuse.limiteLiberado:
        return limiteLiberado;
      case ReasonsRefuse.valorDaParcela:
        return valorDaParcela;
      case ReasonsRefuse.numeroDeParcelas:
        return numeroDeParcelas;
      case ReasonsRefuse.outros:
        return outros;
    }
  }
}

class ReasonsRefusePage extends StatelessWidget {
  const ReasonsRefusePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              isLoading: false,
              variation: ButtonVariations.reject,
              action: () async {},
              textButton: recusarProposta,
            ),
          ),
        ],
      ),
      child: ListView(
        children: [
          Text(
            recusarProposta,
            style: ThemeTypography.headline5.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            porQualMotivoVoceNaoDesejaSeguirComAContratacaoDoCreditoNagro,
            style: ThemeTypography.body1.copyWith(
              color: ThemeColors.kTextLight,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s32),
          ...ReasonsRefuse.values.map((reason) {
            return GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ThemeRadius.r4),
                      ),
                      side: WidgetStateBorderSide.resolveWith(
                        (states) => const BorderSide(
                          width: 0.5,
                          color: ThemeColors.kPrimary,
                        ),
                      ),
                      checkColor: ThemeColors.kPrimary,
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                  ),
                  Text(
                    reason.label,
                    style: ThemeTypography.body1.copyWith(
                      color: ThemeColors.kTextBlack,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
