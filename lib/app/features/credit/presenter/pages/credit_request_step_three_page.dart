import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/components/nagro_list_tile.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/credit/presenter/pages/credit_request_step_three_info_page.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreditRequestStepTwoPage extends StatefulWidget {
  const CreditRequestStepTwoPage({super.key});

  @override
  State<CreditRequestStepTwoPage> createState() =>
      _CreditRequestStepTwoPageState();
}

class _CreditRequestStepTwoPageState extends State<CreditRequestStepTwoPage>
    with WidgetsBindingObserver {
  bool isChecked = false;

  void _handleTextTap(BuildContext context) {
    Modular.to.push(MaterialPageRoute(
      builder: (context) => const CreditRequestStepThreeInfoPage(),
    ));
  }

  void _handleCreditRequest() {
    Modular.to.navigate(Routes.creditTransaction);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      isChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NagroListTile(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  contentPadding: const EdgeInsets.only(
                    left: ThemeSpacings.s0,
                    top: ThemeSpacings.s8,
                    right: ThemeSpacings.s0,
                    bottom: ThemeSpacings.s8,
                  ),
                  leading: SizedBox(
                    height: ThemeSizes.w18,
                    width: ThemeSizes.w18,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      splashRadius: 0,
                      activeColor: ThemeColors.kPrimary,
                      value: isChecked,
                      onChanged: (bool? value) {
                        if (value!) {}
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                  ),
                  title: Text(
                    liEConcordoComOsTermosDeUso,
                    style: ThemeTypography.body2.copyWith(
                      color: ThemeColors.kPrimary,
                    ),
                  ),
                  alignLeadingWithTitle: true,
                ),
                const SizedBox(height: ThemeSpacings.s32),
                PrimaryButton(
                  isLoading: false,
                  action: _handleCreditRequest,
                  textButton: solicitar,
                ),
              ],
            ),
          )
        ],
      ),
      child: ListView(
        children: [
          Text(
            autorizacaoDeConsultaAoSCR,
            textAlign: TextAlign.center,
            style: ThemeTypography.sub1,
          ),
          const SizedBox(height: ThemeSpacings.s24),
          RichText(
            softWrap: true,
            text: TextSpan(
              style: ThemeTypography.body1.copyWith(
                color: ThemeColors.kTextLight,
              ),
              children: [
                const TextSpan(
                  text: autorizoEssaEmpresaAConsultarOsDebitos,
                ),
                TextSpan(
                  text: sistemaDeInformacoesDeCredito,
                  style: ThemeTypography.body1.copyWith(
                    color: ThemeColors.kPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _handleTextTap(context),
                ),
                const TextSpan(
                  text: doBancoCentralDoBrasil,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
