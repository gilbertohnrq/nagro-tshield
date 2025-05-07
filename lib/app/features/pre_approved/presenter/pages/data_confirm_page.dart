import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/input/custom_input.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/components/snack_bar/nagro_snack_bar.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/form/keyboard_helper.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:finan/app/features/pre_approved/presenter/components/why_trust_nagro_banner.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_processing_update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DataConfirmPage extends StatefulWidget {
  const DataConfirmPage({super.key});
  static const route = 'data-confirm';

  @override
  State<DataConfirmPage> createState() => _DataConfirmPageState();
}

class _DataConfirmPageState extends State<DataConfirmPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();

  String _selectedState = 'UF do órgão expedidor';
  bool _tryTapButton = false;

  @override
  void dispose() {
    _rgController.dispose();
    _motherNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: NagroScaffold(
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
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: ThemeSpacings.s16),
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
                          'Confirme os dados capturados',
                          style: bodyText2.copyWith(
                            color: ThemeColors.kTextBase,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: ThemeSpacings.s8),
                        Text(
                          'Caso você identifique alguma informação abaixo que esteja errada, por favor informe os dados corretos.',
                          style: bodyText3.copyWith(
                            color: ThemeColors.kTextLight,
                          ),
                        ),
                        const SizedBox(height: ThemeSpacings.s32),
                        CustomOutlinedTextField(
                          controller: _rgController,
                          labelText: 'Número do RG',
                          keyboardType: TextInputType.text,
                          validator: _validateRG,
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: ThemeSpacings.s32),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: ThemeSizes.h46,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(ThemeSpacings.s6),
                            border: Border.all(
                              width: 1,
                              color: ThemeColors.kGrayEnabled,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: ThemeSpacings.s12,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              style: ThemeTypography.body2.copyWith(
                                color: ThemeColors.kTextBase,
                              ),
                              value: _selectedState,
                              items: stateCodesList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedState = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: ThemeSpacings.s32),
                        CustomOutlinedTextField(
                          controller: _motherNameController,
                          labelText: 'Nome da mãe',
                          validator: _validateMotherName,
                          onChanged: (value) {
                            if (value.isNotEmpty && _tryTapButton) {
                              _formKey.currentState!.validate();
                            }
                          },
                        ),
                        const SizedBox(height: ThemeSpacings.s32),
                      ],
                    ),
                    const WhyTrustNagroBanner(),
                    KeyboardHelper.addSpacingWhenKeyboardIsOpen(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleNextButtonPress() {
    if (_formKey.currentState!.validate()) {
      if (_selectedState == 'UF do órgão expedidor') {
        NagroSnackbar.show(
          text: 'Informe um estado válido',
          status: NagroSnackbarStatus.error,
        );
      } else {
        Modular.to.navigate(PreApprovedProcessingUpdatePage.route);
      }
    } else {
      setState(() {
        _tryTapButton = true;
      });
    }
  }

  String? _validateRG(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite o número do RG';
    }
    return null;
  }

  String? _validateMotherName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite o nome da mãe';
    }
    return null;
  }
}
