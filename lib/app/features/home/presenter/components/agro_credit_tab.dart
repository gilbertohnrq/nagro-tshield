// coverage:ignore-file
import 'package:finan/app/core/theme/components/buttons/credit_request_button.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AgroCreditTab extends StatefulWidget {
  const AgroCreditTab({super.key});

  @override
  State<AgroCreditTab> createState() => _AgroCreditTabState();
}

class _AgroCreditTabState extends State<AgroCreditTab> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AgroCreditHeaderComponent(),
        SizedBox(height: ThemeSpacings.s16),
        AgroCreditButtonComponent(),
      ],
    );
  }
}

class AgroCreditHeaderComponent extends StatelessWidget {
  const AgroCreditHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        creditoAgro,
        style: ThemeTypography.body3.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class AgroCreditButtonComponent extends StatelessWidget {
  const AgroCreditButtonComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CreditRequestButton.standard(
      action: () {
        Modular.to.pushNamed('/home/info');
      },
      textButton: 'Biometria Facial',
      subtextButton: 'POC UnicoCheck',
      color:
          const LinearGradient(colors: [Color(0xFF0099FF), Color(0xFF0099FF)]),
      image: 'assets/images/agro_credit_tab.png',
    );
  }
}
