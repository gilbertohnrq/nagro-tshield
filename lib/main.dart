// coverage:ignore-file
import 'package:finan/app/app_module.dart';
import 'package:finan/app/app_widget.dart';
import 'package:finan/app/core/router/custom_router_observer.dart';
import 'package:finan/app/core/services/app_links/app_links_service_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  Modular.setObservers([RouteObserverProvider().routeObserver]);

  Future.delayed(const Duration(seconds: 1), () async {
    final appLinksService = Modular.get<AppLinksService>();
    await appLinksService.initDeepLinks();
  });

  initializeDateFormatting('pt_BR').then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    );
  }
}
