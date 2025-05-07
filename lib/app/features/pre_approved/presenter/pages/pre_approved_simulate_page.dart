import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/card/card_amount.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/pre_approved/presenter/components/date_picker_custom.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:finan/app/features/pre_approved/presenter/components/reduce_value_bottom.dart';
import 'package:finan/app/features/pre_approved/presenter/components/why_trust_nagro_banner.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/document_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreApprovedSimulateProposalPage extends StatefulWidget {
  final String loanAmount;
  const PreApprovedSimulateProposalPage({required this.loanAmount, super.key});
  @override
  State<PreApprovedSimulateProposalPage> createState() =>
      _PreApprovedSimulateProposalPageState();
}

class _PreApprovedSimulateProposalPageState
    extends State<PreApprovedSimulateProposalPage> {
  List<DateTime?> curDate = [DateTime.now().add(const Duration(days: 30))];
  bool datePickerIsActive = false;

  Future<void> refreshData() async {}

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      actions: const [NeedHelpWhatsapp()],
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: proximo,
              isLoading: false,
              action: () {
                Modular.to.pushNamed(DocumentSelectionPage.route);
              },
            ),
          ),
        ],
      ),
      child: RefreshIndicator.adaptive(
        onRefresh: refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: ThemeSpacings.s8),
              Text(
                simuleAsParcelas,
                style: bodyText2.copyWith(
                  color: ThemeColors.kTextBase,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s16),
              Text(
                valorPreAprovado,
                style: bodyText3.copyWith(
                  color: ThemeColors.kTextLight,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\$ 1000,00',
                    style: ThemeTypography.headline5.copyWith(
                      color: ThemeColors.kTextBase,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ReduceValueBottom(grossAmount: widget.loanAmount)
                ],
              ),
              const SizedBox(height: ThemeSpacings.s24),
              Text(
                selecioneAQuantidadeDeParcelas,
                style: bodyText3.copyWith(
                  color: ThemeColors.kTextLight,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s16),
              SliderComponent(
                curDate: curDate,
              ),
              const SizedBox(height: ThemeSpacings.s24),
              Text(
                informeADataDaPrimeiraParcela,
                style: bodyText3.copyWith(
                  color: ThemeColors.kTextLight,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s4),
              DatePickerComponent(
                datePickerIsActive: datePickerIsActive,
                curDate: curDate,
                onDateChanged: (dates) {
                  setState(() {
                    curDate = dates;
                    datePickerIsActive = false;
                  });
                },
                onActivatePicker: () {
                  setState(() {
                    datePickerIsActive = true;
                  });
                },
              ),
              const SizedBox(height: ThemeSpacings.s24),
              const Divider(),
              const SizedBox(height: ThemeSpacings.s24),
              Text(
                condicoes,
                style: bodyText2.copyWith(
                  color: ThemeColors.kTextBase,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s24),
              const ConditionsComponent(),
              const WhyTrustNagroBanner()
            ],
          ),
        ),
      ),
    );
  }
}

class SliderComponent extends StatelessWidget {
  final List<DateTime?> curDate;
  const SliderComponent({
    super.key,
    required this.curDate,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Slider(
            onChangeEnd: (value) async {},
            value: 20,
            min: 20,
            max: 24,
            divisions: 4,
            onChanged: (double value) {},
          ),
        ),
        Text(
          '',
          style: ThemeTypography.headline3.copyWith(
            color: ThemeColors.kTextBase,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class ConditionsComponent extends StatelessWidget {
  const ConditionsComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'xx',
            style: ThemeTypography.headline4.copyWith(
              color: ThemeColors.kPrimary,
              fontWeight: FontWeight.w700,
            ),
            children: <TextSpan>[
              const TextSpan(
                text: ' de ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.kTextLight,
                ),
              ),
              const TextSpan(
                text: 'R\$ 00',
              ),
            ],
          ),
        ),
        const SizedBox(height: ThemeSpacings.s24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ThemeSizes.h36,
              child: CardAmount(
                cardData: CardAmountHolderObject(
                  label: 'Valor Financiado',
                  value: '',
                ),
              ),
            ),
            SizedBox(
              height: ThemeSizes.h36,
              child: CardAmount(
                cardData: CardAmountHolderObject(
                  label: valorDoIOF,
                  value: '',
                ),
              ),
            ),
            SizedBox(
              height: ThemeSizes.h36,
              child: CardAmount(
                cardData: CardAmountHolderObject(
                  label: taxaDeCadastro,
                  value: '',
                ),
              ),
            ),
            SizedBox(
              height: ThemeSizes.h36,
              child: CardAmount(
                cardData: CardAmountHolderObject(
                  label: jurosAM,
                  value: '',
                ),
              ),
            ),
            SizedBox(
              height: ThemeSizes.h36,
              child: CardAmount(
                cardData: CardAmountHolderObject(
                  label: cetAA,
                  value: '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
