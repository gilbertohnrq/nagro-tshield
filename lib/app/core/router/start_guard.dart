// coverage:ignore-file
import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartGuard extends RouteGuard {
  StartGuard() : super(redirectTo: 'home');

  final localDataManager = Modular.get<ILocalDataService>();

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final String? token = await localDataManager.get(tokenJWTKey);
    return token == null || token.isEmpty;
  }
}
