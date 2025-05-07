// coverage:ignore-file
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/nagro_shimmer.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';

class CreditRequestFinishLoadingPage extends StatefulWidget {
  const CreditRequestFinishLoadingPage({super.key});

  @override
  State<CreditRequestFinishLoadingPage> createState() =>
      _CreditRequestFinishLoadingPageState();
}

class _CreditRequestFinishLoadingPageState
    extends State<CreditRequestFinishLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      child: ListView(
        children: [
          Text(
            finalizandoPedidoDeCredito,
            textScaler: const TextScaler.linear(1),
            style: ThemeTypography.headline5.copyWith(
              fontWeight: FontWeight.w700,
              color: ThemeColors.kTextBlack,
            ),
          ),
          const SizedBox(width: ThemeSpacings.s48),
          NagroShimmer(height: ThemeSizes.h150),
          const SizedBox(width: ThemeSpacings.s16),
          NagroShimmer(height: ThemeSizes.h150),
        ],
      ),
    );
  }
}
