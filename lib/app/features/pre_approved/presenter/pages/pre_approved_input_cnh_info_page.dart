import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/dropdown/custom_dropdown_uf.dart';
import 'package:finan/app/core/theme/components/input/custom_input.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_radius.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/form/keyboard_helper.dart';
import 'package:finan/app/core/utils/formats/mask_formatters.dart';
import 'package:finan/app/features/pre_approved/presenter/components/help_option.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:finan/app/features/pre_approved/presenter/components/why_trust_nagro_banner.dart';
import 'package:finan/app/features/pre_approved/presenter/pages/pre_approved_processing_update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreApprovedInputCNHInfoPage extends StatefulWidget {
  const PreApprovedInputCNHInfoPage({super.key});

  static const route = 'input-cnh-info';

  @override
  State<PreApprovedInputCNHInfoPage> createState() =>
      _PreApprovedInputCNHInfoPageState();
}

class _PreApprovedInputCNHInfoPageState
    extends State<PreApprovedInputCNHInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _rgNumberController = TextEditingController();

  final TextEditingController _ufIssuingBodyController =
      TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();

  final bool _tryTapButton = false;

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      resizeToAvoidBottomInset: false,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: ThemeSpacings.s8),
                    Text(
                      informeOsDadosDaSuaCarteira,
                      style: bodyText2.copyWith(
                        color: ThemeColors.kTextBase,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    CustomOutlinedTextField(
                      keyboardType: TextInputType.number,
                      controller: _rgNumberController,
                      labelText: numeroDoRg,
                      onChanged: _handleFieldChange,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Digite o número do seu RG'
                          : null,
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    CustomDropdownUf(
                      formKeyValidate: () => _formKey.currentState!.validate(),
                      labelText: ufDoOrgaoExpedidor,
                      textEditingController: _ufIssuingBodyController,
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    CustomOutlinedTextField(
                      controller: _motherNameController,
                      labelText: nomeDaMae,
                      maskTextInputFormatter: [
                        lettersAndAccentsOnlyFormatter,
                      ],
                      onChanged: _handleFieldChange,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Digite o nome da sua mãe'
                          : null,
                    ),
                    const SizedBox(height: ThemeSpacings.s32),
                    Container(
                      alignment: Alignment.center,
                      height: ThemeSizes.h260,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(ThemeSpacings.s8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ThemeRadius.r8),
                        color: ThemeColors.kBackground,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            estaComDificuldade,
                            style: bodyText3.copyWith(
                              color: ThemeColors.kPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: ThemeSpacings.s4),
                          Text(
                            naoConsegueEncontrarOsDados,
                            style: bodyText3,
                          ),
                          const SizedBox(height: ThemeSpacings.s16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HelpOptionComponent(
                                onTap: () {
                                  Modular.to.pushNamed('new-cnh-example');
                                },
                                imagePath: Assets.newCNHInfo,
                                label: cnhSpaceNova,
                              ),
                              HelpOptionComponent(
                                onTap: () {
                                  Modular.to.pushNamed('old-cnh-example');
                                },
                                imagePath: Assets.oldCNHInfo,
                                label: cnhSpaceAntiga,
                              ),
                            ],
                          ),
                        ],
                      ),
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
    Modular.to.pushNamed(PreApprovedProcessingUpdatePage.route);
  }

  void _handleFieldChange(String value) {
    if (value.isNotEmpty && _tryTapButton) {
      _formKey.currentState!.validate();
    }
  }
}
