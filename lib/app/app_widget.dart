// coverage:ignore-file

import 'package:finan/app/core/theme/components/snack_bar/nagro_snack_bar.dart';
import 'package:finan/app/core/theme/size_config.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp.router(
      locale: const Locale('pt', 'BR'),
      title: 'NAGRO',
      theme: ThemeSystem.theme,
      routerConfig: Modular.routerConfig,
      builder: EasyLoading.init(),
      scaffoldMessengerKey: snackbarKey,
    );
  }
}
