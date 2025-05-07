// coverage:ignore-file
import 'package:finan/app/core/services/flutter_logs/flutter_logs_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';

class CustomObserver extends RouteObserver<ModalRoute> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      FlutterLogsServiceImpl().registerLog(
          'Route Changed PUSH',
          'Previous route: ${previousRoute.settings.name.toString()}',
          'New Route: ${route.settings.name}',
          LogLevel.INFO);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      FlutterLogsServiceImpl().registerLog(
          'Route POP',
          'Back to Previous route: ${previousRoute.settings.name.toString()}',
          'Route: ${route.settings.name}',
          LogLevel.INFO);
    }
    super.didPop(route, previousRoute);
  }
}

class RouteObserverProvider {
  final RouteObserver<ModalRoute> routeObserver = CustomObserver();
}
