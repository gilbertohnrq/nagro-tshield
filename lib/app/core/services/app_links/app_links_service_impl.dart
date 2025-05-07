// coverage:ignore-file
import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:finan/app/core/services/app_links/app_links_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppLinksService implements IAppLinksService {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  @override
  Future<void> initDeepLinks() async {
    debugPrint('Deep links initialized.');
    if (_linkSubscription != null && !_linkSubscription!.isPaused) {
      return;
    }

    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _handleIncomingUri(uri);
    });
  }

  void _handleIncomingUri(Uri uri) {
    final path = uri.fragment.isNotEmpty ? uri.fragment : uri.path;
    Modular.to.navigate(path);
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
  }
}
