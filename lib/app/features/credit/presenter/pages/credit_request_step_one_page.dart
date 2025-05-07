import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/nagro_radio_row.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/constants/app_widget_keys.dart';
import 'package:finan/app/core/utils/formats/mask_formatters.dart';
import 'package:finan/app/core/utils/formats/validators.dart';
import 'package:finan/app/features/credit/infra/models/credit_request/credit_request.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreditRequestStepOnePage extends StatefulWidget {
  const CreditRequestStepOnePage({super.key});

  @override
  State<CreditRequestStepOnePage> createState() =>
      _CreditRequestStepOnePageState();
}

class _CreditRequestStepOnePageState extends State<CreditRequestStepOnePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();

  RuralProducerStatus? _ruralProducerStatus;
  CreditRestrictionStatus? _creditRestrictionStatus;

  @override
  void initState() {
    super.initState();

    _initializeTextFields();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    phoneEditingController.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  void _initializeTextFields() {
    emailEditingController.text = 'teste@teste.com';
    phoneEditingController.text = '11999999999';
  }

  void _handleCreditRequest() {
    if (_formKey.currentState!.validate()) {
      Modular.to.pushNamed(Routes.creditRequestTwoStep);
    }
  }

  void _onRuralProductorRadioChanged(Object? value) {
    setState(() {
      _ruralProducerStatus = value as RuralProducerStatus;
    });

    if (_ruralProducerStatus == RuralProducerStatus.no) {
      Modular.to.pushNamed(Routes.notRuralProducer);
    }
  }

  void _onCreditRestrictionRadioChanged(Object? value) {
    setState(() {
      _creditRestrictionStatus = value as CreditRestrictionStatus;
    });

    if (_creditRestrictionStatus == CreditRestrictionStatus.yes) {
      Modular.to.pushNamed(Routes.creditRestriction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              action: _isFormValid ? _onContinuePressed : null,
              textButton: proximo,
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                right: ThemeSpacings.s16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          style: ThemeTypography.body1
                              .copyWith(color: ThemeColors.kTextLight),
                          children: [
                            const TextSpan(text: oCreditoNagroE),
                            TextSpan(
                              text: produtorRuralPonto,
                              style: ThemeTypography.body1.copyWith(
                                color: ThemeColors.kPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                                text: eUmRecurcoLivreParaVoceAplicar),
                          ],
                        ),
                      ),
                      const SizedBox(height: ThemeSpacings.s16),
                      Text(
                        rapidoSimplesESemBurocracias,
                        textAlign: TextAlign.start,
                        style: ThemeTypography.body1.copyWith(
                          color: ThemeColors.kTextLight,
                        ),
                      ),
                      const SizedBox(height: ThemeSpacings.s32),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PhoneNumberInputField(
                              controller: phoneEditingController,
                              focusNode: phoneFocusNode,
                              isEnabled: _isFormValid,
                              hintText: celular,
                              labelText: digiteONumeroDoSeuCelular,
                              validator: validatePhone,
                              inputFormatters: [phoneMaskFormatter],
                              getTextColor: _getTextColor,
                              fontFamily: fontFamily,
                            ),
                            const SizedBox(height: ThemeSpacings.s16),
                            EmailInputField(
                              controller: emailEditingController,
                              focusNode: emailFocusNode,
                              isEnabled: _isFormValid,
                              hintText: email,
                              labelText: digiteOSeuEmail,
                              validator: validateEmail,
                              onFieldSubmitted: _handleCreditRequest,
                              inputFormatters: [emailMaskFormatter],
                              getTextColor: _getTextColor,
                              fontFamily: fontFamily,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: ThemeSpacings.s24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            voceEProdutorRural,
                            style: ThemeTypography.body2,
                          ),
                          const SizedBox(height: ThemeSpacings.s16),
                          NagroRadioRow<RuralProducerStatus>(
                            items: [
                              RadioFormItemModel(
                                label: sim,
                                value: RuralProducerStatus.yes,
                                onChanged: _onRuralProductorRadioChanged,
                              ),
                              RadioFormItemModel(
                                label: nao,
                                value: RuralProducerStatus.no,
                                onChanged: _onRuralProductorRadioChanged,
                              ),
                            ],
                            groupValue: _ruralProducerStatus,
                            isValid: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: ThemeSpacings.s24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            voceTemRestricaoDeCredito,
                            style: ThemeTypography.body2,
                          ),
                          const SizedBox(height: ThemeSpacings.s16),
                          NagroRadioRow<CreditRestrictionStatus>(
                            items: [
                              RadioFormItemModel(
                                label: sim,
                                value: CreditRestrictionStatus.yes,
                                onChanged: _onCreditRestrictionRadioChanged,
                              ),
                              RadioFormItemModel(
                                label: nao,
                                value: CreditRestrictionStatus.no,
                                onChanged: _onCreditRestrictionRadioChanged,
                              ),
                            ],
                            groupValue: _creditRestrictionStatus,
                            isValid: true,
                          ),
                        ],
                      ),
                      Expanded(child: Container(height: ThemeSpacings.s64)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onContinuePressed() {
    _handleCreditRequest();
  }

  Color _getTextColor() {
    return _isFormValid ? ThemeColors.kTextLight : ThemeColors.kGray50;
  }

  bool get _isFormValid =>
      _ruralProducerStatus?.isRuralProducer == true &&
      _creditRestrictionStatus?.hasCreditRestriction == false;
}

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isEnabled;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final VoidCallback onFieldSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final Color Function() getTextColor;
  final String fontFamily;

  const EmailInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isEnabled,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.onFieldSubmitted,
    required this.inputFormatters,
    required this.getTextColor,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: ThemeTypography.body2.copyWith(
            color: getTextColor(),
            fontFamily: fontFamily,
          ),
        ),
        const SizedBox(height: ThemeSpacings.s8),
        TextFormField(
          key: Keys.creditEmailKey,
          controller: controller,
          enabled: isEnabled,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            errorStyle: const TextStyle(fontSize: 0, height: 1.6),
            isDense: true,
            hintText: hintText,
            hintStyle: ThemeTypography.body1.copyWith(
              color: getTextColor(),
              fontFamily: fontFamily,
            ),
          ),
          validator: validator,
          onFieldSubmitted: (_) => onFieldSubmitted(),
        ),
      ],
    );
  }
}

class PhoneNumberInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isEnabled;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final Color Function() getTextColor;
  final String fontFamily;

  const PhoneNumberInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isEnabled,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.inputFormatters,
    required this.getTextColor,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: ThemeTypography.body2.copyWith(
            color: getTextColor(),
            fontFamily: fontFamily,
          ),
        ),
        const SizedBox(height: ThemeSpacings.s8),
        TextFormField(
          key: Keys.creditPhoneNumberKey,
          controller: controller,
          enabled: isEnabled,
          focusNode: focusNode,
          keyboardType: TextInputType.phone,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            errorStyle: const TextStyle(fontSize: 0, height: 1.6),
            isDense: true,
            hintText: hintText,
            hintStyle: ThemeTypography.body1.copyWith(
              color: getTextColor(),
              fontFamily: fontFamily,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
