import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/buttons/primary_button.dart';
import 'package:finan/app/core/theme/components/input/custom_input.dart';
import 'package:finan/app/core/theme/components/nagro_floating_dock.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/formats/validators.dart';
import 'package:finan/app/features/pre_approved/presenter/components/need_help_whatsapp.dart';
import 'package:finan/app/features/pre_approved/presenter/components/why_trust_nagro_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreApprovedUpdateContactPage extends StatefulWidget {
  const PreApprovedUpdateContactPage({super.key});

  @override
  State<PreApprovedUpdateContactPage> createState() =>
      _PreApprovedUpdateContactPageState();
}

class _PreApprovedUpdateContactPageState
    extends State<PreApprovedUpdateContactPage> {
  final phoneOrEmailTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            action: () async {
              Modular.to.pushReplacementNamed('input-bank');
            },
          )),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: ThemeSpacings.s8),
              Text(
                informeSeuContato,
                style: bodyText2.copyWith(
                    color: ThemeColors.kTextBase, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: ThemeSpacings.s32),
              Form(
                key: _formKey,
                child: CustomOutlinedTextField(
                  controller: phoneOrEmailTextEditingController,
                  labelText: email,
                  validator: validateEmail,
                ),
              ),
              const SizedBox(height: ThemeSpacings.s12),
              Text(
                voceReceberaUmEmail,
                style: bodyText4.copyWith(
                    color: ThemeColors.kTextBase, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const WhyTrustNagroBanner()
        ],
      ),
    );
  }
}
