// coverage:ignore-file
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/input/custom_input.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/form/keyboard_helper.dart';
import 'package:finan/app/core/utils/formats/mask_formatters.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:finan/app/features/pre_approved/presenter/components/why_trust_nagro_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreApprovedInputBankPage extends StatefulWidget {
  const PreApprovedInputBankPage({super.key});

  @override
  State<PreApprovedInputBankPage> createState() =>
      _PreApprovedInputBankPageState();
}

class _PreApprovedInputBankPageState extends State<PreApprovedInputBankPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _taxIdController = TextEditingController();
  final TextEditingController _codeBankController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _digitController = TextEditingController();

  bool _tryTapButton = false;
  final String _selectedBank = '';
  String? _bankErrorMessage;

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      actions: const [NeedHelpWhatsapp()],
      bottomNavigationBar: NagroFloatingDock(
        children: [
          Expanded(
            child: PrimaryButton(
              textButton: proximo,
              action: _handleNextButtonPress,
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: ThemeSpacings.s8),
                    Text(
                      informeSeusDadosBancarios,
                      style: bodyText2.copyWith(
                        color: ThemeColors.kTextBase,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    CustomOutlinedTextField(
                      onChanged: (value) {
                        if (value.isNotEmpty && _tryTapButton) {
                          _formKey.currentState!.validate();
                        }
                      },
                      validator: (value) {
                        return null;
                      },
                      controller: _taxIdController,
                      labelText: cpfDoTitularDaConta,
                      maskTextInputFormatter: [cpfMaskFormatter],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: ThemeSizes.h46,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(ThemeSpacings.s6),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      _bankErrorMessage != null && _tryTapButton
                                          ? ThemeColors.kDenied
                                          : ThemeColors.kGrayEnabled),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: ThemeSpacings.s12),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    _selectedBank.isEmpty
                                        ? selecione
                                        : _selectedBank,
                                    style: ThemeTypography.body2
                                        .copyWith(color: ThemeColors.kTextBase),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                const Icon(Icons.arrow_drop_down, size: 12),
                              ],
                            ),
                          ),
                        ),
                        if (_bankErrorMessage != null && _tryTapButton)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 12),
                            child: Text(
                              _bankErrorMessage!,
                              style: ThemeTypography.body3.copyWith(
                                color: ThemeColors.kDenied,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: ThemeSpacings.s16),
                    const InfoBoxComponent(
                      title: validoSomente,
                      subtitle: contaCorrente,
                    ),
                    const SizedBox(height: ThemeSpacings.s16),
                    CustomOutlinedTextFieldComponent(
                      controller: _branchController,
                      labelText: agenciaLabel,
                      maskFormatter: [branchBankMaskFormatter],
                      validator: _validateBranch,
                      formKey: _formKey,
                      tryTapButton: _tryTapButton,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    CustomOutlinedTextFieldComponent(
                      controller: _accountNumberController,
                      labelText: numeroDaContaLabel,
                      maskFormatter: [numberAccountMaskFormatter],
                      validator: _validateAccountNumber,
                      formKey: _formKey,
                      tryTapButton: _tryTapButton,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    CustomOutlinedTextFieldComponent(
                      controller: _digitController,
                      labelText: digito,
                      validator: _validateDigit,
                      formKey: _formKey,
                      tryTapButton: _tryTapButton,
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    const InfoBoxImportantComponent(
                      title:
                          reviseBemOsDadosBancariosAntesDeContratarSeuCredito,
                    ),
                    const SizedBox(height: ThemeSpacings.s16),
                  ],
                ),
                const WhyTrustNagroBanner(),
                KeyboardHelper.addSpacingWhenKeyboardIsOpen(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleNextButtonPress() {
    final bool isBankSelected = _codeBankController.text.isNotEmpty;

    setState(() {
      _bankErrorMessage = isBankSelected ? null : 'Selecione um banco';
      _tryTapButton = true;
    });
  }

  String? _validateBranch(String? value) {
    if (value == null || value.length < 4) {
      return 'Digite sua agência';
    }
    return null;
  }

  String? _validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite sua conta';
    }
    return null;
  }

  String? _validateDigit(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite o dígito de sua conta';
    }
    return null;
  }
}

class InfoBoxComponent extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoBoxComponent({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ThemeSpacings.s8),
      height: ThemeSizes.h37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeRadius.r8),
        color: ThemeColors.kBackground,
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: ThemeColors.kDenied),
          const SizedBox(width: ThemeSpacings.s8),
          RichText(
            text: TextSpan(
              style:
                  ThemeTypography.body2.copyWith(color: ThemeColors.kTextLight),
              children: [
                TextSpan(text: title),
                TextSpan(
                  text: subtitle,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoBoxImportantComponent extends StatelessWidget {
  final String title;

  const InfoBoxImportantComponent({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(ThemeSpacings.s8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeRadius.r8),
        color: ThemeColors.kBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error_outline, color: ThemeColors.kDenied),
              const SizedBox(width: ThemeSpacings.s8),
              Text(
                importante,
                style: bodyText3.copyWith(
                  color: ThemeColors.kDenied,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: ThemeSpacings.s4),
          Text(
            title,
            style: bodyText3,
          ),
        ],
      ),
    );
  }
}

class CustomOutlinedTextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter>? maskFormatter;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final GlobalKey<FormState> formKey;
  final bool tryTapButton;

  const CustomOutlinedTextFieldComponent(
      {super.key,
      required this.controller,
      required this.labelText,
      this.maskFormatter,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      required this.formKey,
      required this.tryTapButton});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      controller: controller,
      labelText: labelText,
      maskTextInputFormatter: maskFormatter,
      keyboardType: keyboardType,
      onChanged: (value) {
        if (value.isNotEmpty && tryTapButton) {
          formKey.currentState?.validate();
        }
        if (onChanged != null) onChanged!(value);
      },
      validator: validator,
    );
  }
}
