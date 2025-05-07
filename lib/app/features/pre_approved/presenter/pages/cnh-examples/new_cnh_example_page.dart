import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:finan/app/core/theme/theme_spacings.dart';
import 'package:finan/app/core/theme/theme_typography.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewCnhExamplePage extends StatefulWidget {
  const NewCnhExamplePage({super.key});

  @override
  State<NewCnhExamplePage> createState() => _NewCnhExamplePageState();
}

class _NewCnhExamplePageState extends State<NewCnhExamplePage> {
  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: ThemeSpacings.s8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                cnhNova,
                style: bodyText2.copyWith(
                    color: ThemeColors.kTextBase, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: ThemeSpacings.s8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                vejaNaImagemAbaixoComoEncontrarOsCamposCnhNova,
                style: bodyText3.copyWith(color: ThemeColors.kTextLight),
              ),
            ),
            const SizedBox(height: ThemeSpacings.s24),
            Image.asset(
              Assets.newCNHExample,
              alignment: Alignment.centerLeft,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
