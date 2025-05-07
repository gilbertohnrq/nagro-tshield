// coverage:ignore-file
import 'package:finan/app/core/services/url_launcher/url_launcher_service.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NeedHelpWhatsapp extends StatelessWidget {
  const NeedHelpWhatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    final urlLauncher = Modular.get<IUrlLaunchService>();

    return GestureDetector(
      onTap: () async {
        await urlLauncher.launchWhatsApp(
          phone: preApprovedSupportWhatsappNumber,
          message: preAprovadoMensagem,
        );
      },
      child: SvgPicture.asset(
        Assets.needHelp,
        width: ThemeSizes.w177,
        height: ThemeSizes.h34,
      ),
    );
  }
}
