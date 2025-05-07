import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/dropdown/custom_dropdown_uf.dart';
import 'package:finan/app/core/theme/components/input/custom_input.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/form/keyboard_helper.dart';
import 'package:finan/app/core/utils/formats/mask_formatters.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:finan/app/features/pre_approved/presenter/components/why_trust_nagro_banner.dart';
import 'package:finan/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreApprovedInputAddressPage extends StatefulWidget {
  const PreApprovedInputAddressPage({super.key});

  static const route = 'input-address';

  @override
  State<PreApprovedInputAddressPage> createState() =>
      _PreApprovedInputAddressPageState();
}

class _PreApprovedInputAddressPageState
    extends State<PreApprovedInputAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final bool _tryTapButton = false;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: ThemeSpacings.s8),
                Text(
                  informeSeuEndereco,
                  style: bodyText2.copyWith(
                    color: ThemeColors.kTextBase,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: ThemeSpacings.s32),
                CustomOutlinedTextField(
                  maskTextInputFormatter: [cepMaskFormatter],
                  keyboardType: TextInputType.number,
                  controller: _cepController,
                  labelText: cep,
                  onChanged: _handleCepChange,
                  validator: (value) => value == null || value.length < 9
                      ? 'Digite um CEP válido'
                      : null,
                ),
                const SizedBox(height: ThemeSpacings.s32),
                CustomOutlinedTextField(
                  controller: _addressController,
                  labelText: endereco,
                  onChanged: (value) {
                    if (value.isNotEmpty && _tryTapButton) {
                      _formKey.currentState!.validate();
                    }
                  },
                  validator: (value) => value == null || value.isEmpty
                      ? 'Digite um endereço válido'
                      : null,
                ),
                const SizedBox(height: ThemeSpacings.s32),
                CustomOutlinedTextField(
                  controller: _neighborhoodController,
                  labelText: bairro,
                  onChanged: (value) {
                    if (value.isNotEmpty && _tryTapButton) {
                      _formKey.currentState!.validate();
                    }
                  },
                  validator: (value) => value == null || value.isEmpty
                      ? 'Digite um bairro válido'
                      : null,
                ),
                const SizedBox(height: ThemeSpacings.s32),
                CustomOutlinedTextField(
                  controller: _cityController,
                  labelText: cidade,
                  onChanged: (value) {
                    if (value.isNotEmpty && _tryTapButton) {
                      _formKey.currentState!.validate();
                    }
                  },
                  validator: (value) => value == null || value.isEmpty
                      ? 'Digite uma cidade válida'
                      : null,
                ),
                const SizedBox(height: ThemeSpacings.s32),
                CustomDropdownUf(
                  formKeyValidate: () => _formKey.currentState!.validate(),
                  labelText: uf,
                  textEditingController: _ufController,
                ),
                const SizedBox(height: ThemeSpacings.s32),
                CustomOutlinedTextField(
                  maskTextInputFormatter: [onlyNumberMaskFormatter],
                  controller: _numberController,
                  labelText: numero,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.isNotEmpty && _tryTapButton) {
                      _formKey.currentState!.validate();
                    }
                  },
                  validator: (value) => value == null || value.isEmpty
                      ? 'Digite um número válido'
                      : null,
                ),
                const SizedBox(height: ThemeSpacings.s16),
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
    Modular.to.pushNamed(Routes.inputContact);
  }

  Future<void> _handleCepChange(String value) async {}
}
