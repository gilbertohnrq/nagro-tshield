import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/card/card_amount_biometric.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/features/biometric_signature/infra/models/get_proposal_available_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiometricsProposalDetailsPage extends StatefulWidget {
  final GetProposalAvailableResponse proposalResponse;

  const BiometricsProposalDetailsPage({
    super.key,
    required this.proposalResponse,
  });

  @override
  State<BiometricsProposalDetailsPage> createState() =>
      _BiometricsProposalDetailsPageState();
}

class _BiometricsProposalDetailsPageState
    extends State<BiometricsProposalDetailsPage> {
  final formatCurrency =
      NumberFormat.currency(locale: "pt_BR", name: "BRL", symbol: "");
  final percent = NumberFormat.decimalPatternDigits(decimalDigits: 2);

  String getFormatedDuoDate(DateTime target) {
    final formatDate = DateFormat('d/MM/y');
    return formatDate.format(target);
  }

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      child: ListView(
        children: [
          Text(
            operacao,
            style: ThemeTypography.headline5.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          SizedBox(
            height: ThemeSizes.h120,
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: valorBruto,
                            value:
                                "R\$${formatCurrency.format(widget.proposalResponse.gross_amount)}",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: totalDasParcelas,
                            value:
                                "R\$${formatCurrency.format(widget.proposalResponse.installments_amount_total)}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ThemeSizes.h50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: valorDoIOF,
                            value:
                                "R\$${formatCurrency.format(widget.proposalResponse.iof_amount)}",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: taxaDeCadastro,
                            value:
                                "R\$${formatCurrency.format(widget.proposalResponse.cad_amount)}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          const Divider(color: ThemeColors.kGray500),
          const SizedBox(height: ThemeSpacings.s16),
          SizedBox(
            height: ThemeSizes.h50,
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: jurosAM,
                            value:
                                "${percent.format(widget.proposalResponse.monthly_interest_rate)}%",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: jurosAnual,
                            value:
                                "${percent.format(widget.proposalResponse.annual_interest_rate)}%",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          const Divider(color: ThemeColors.kGray500),
          const SizedBox(height: ThemeSpacings.s16),
          SizedBox(
            height: ThemeSizes.h50,
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: cetAM,
                            value:
                                "${percent.format(widget.proposalResponse.monthly_cet)}%",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: cetAA,
                            value:
                                "${percent.format(widget.proposalResponse.annual_cet)}%",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          const Divider(color: ThemeColors.kGray500),
          const SizedBox(height: ThemeSpacings.s16),
          SizedBox(
            height: ThemeSizes.h50,
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: prazoTotal,
                            value:
                                "${widget.proposalResponse.term_duration} dias",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CardAmountBiometric(
                          cardData: CardAmountHolderObject(
                            label: carencia,
                            value:
                                "${widget.proposalResponse.principal_grace_period} dias",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          const Divider(color: ThemeColors.kGray500),
          const SizedBox(height: ThemeSpacings.s16),
          Text(
            parcelas,
            style: ThemeTypography.headline5.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: ThemeSpacings.s16),
          getInstallments(),
        ],
      ),
    );
  }

  Widget getInstallments() {
    final rowStyle = ThemeTypography.body3.copyWith(
      color: ThemeColors.kTextLight,
    );

    final List<InstallmentForecast> filterProposalForecast = [];

    for (int i = 0;
        i < widget.proposalResponse.installments_forecast!.length;
        i++) {
      if (widget.proposalResponse.installments_forecast!
              .elementAt(i)
              .installment_amount >
          0) {
        filterProposalForecast
            .add(widget.proposalResponse.installments_forecast!.elementAt(i));
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filterProposalForecast.length,
      itemBuilder: (context, index) {
        return Container(
          color: (index % 2) == 0 ? ThemeColors.kGray950 : ThemeColors.kAccent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeSpacings.s8,
              horizontal: ThemeSpacings.s16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ThemeSizes.w32,
                        height: ThemeSizes.w32,
                        decoration: BoxDecoration(
                          color: ThemeColors.kBlue750,
                          borderRadius: BorderRadius.circular(ThemeRadius.r16),
                        ),
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: ThemeTypography.body1.copyWith(
                              color: ThemeColors.kPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: ThemeSpacings.s6,
                          bottom: ThemeSpacings.s6,
                        ),
                        child: Text(
                          getFormatedDuoDate(DateTime.parse(
                              filterProposalForecast[index].due_date)),
                          style: rowStyle,
                        ),
                      ),
                      Text(
                        "Saldo R\$ ${formatCurrency.format(filterProposalForecast[index].current_balance_amount)}",
                        style: rowStyle,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "R\$ ${formatCurrency.format(filterProposalForecast[index].installment_amount)}",
                        style: ThemeTypography.sub1.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: ThemeSpacings.s6,
                          bottom: ThemeSpacings.s6,
                        ),
                        child: Text(
                          "Amortização R\$ ${formatCurrency.format(filterProposalForecast[index].amortization_amount)}",
                          style: rowStyle,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Text(
                        "Juros R\$ ${formatCurrency.format(filterProposalForecast[index].interest_amount)}",
                        style: rowStyle,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
