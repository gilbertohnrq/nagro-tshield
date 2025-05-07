// coverage:ignore-file
//coverage:ignore-file
import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service.dart';
import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service_impl.dart';
import 'package:finan/app/core/services/upgrader/upgrader_service.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:finan/app/core/utils/generic/upgrader.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpgraderServiceImpl implements IUpgraderService {
  late final CloudFirestoreService<Upgrader> _upgraderService;

  UpgraderServiceImpl()
      : _upgraderService = CloudFirestoreServiceImpl<Upgrader>();

  @override
  Future<String?> getVersion() async {
    final curFlagJson = await _upgraderService.read(upgraderCollectionName, 'current-version');

    if(curFlagJson == null) {
      return null;
    }

    return Upgrader.fromJson(curFlagJson).version;
  }

  @override
  Future<bool> appVersionIsOutdated() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final curFlagJson = await _upgraderService.read(upgraderCollectionName, 'current-version');

    if(curFlagJson == null) {
      return false;
    }

    return packageInfo.version != Upgrader.fromJson(curFlagJson).version;
  }
}