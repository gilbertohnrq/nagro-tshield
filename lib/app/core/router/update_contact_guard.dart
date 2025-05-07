// coverage:ignore-file
import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateContactGuard extends RouteGuard {
  UpdateContactGuard() : super(redirectTo: 'input-bank');

  final localDataManager = Modular.get<ILocalDataService>();

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final String? currentPhone = await localDataManager.get(phoneProfile);
    final String? currentEmail = await localDataManager.get(emailProfile);
    return (currentPhone == null || currentPhone.isEmpty) ||
        (currentEmail == null || currentEmail.isEmpty);
  }
}
