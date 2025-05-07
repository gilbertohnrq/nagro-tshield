// coverage:ignore-file
//coverage:ignore-file
abstract class IUpgraderService {
  Future<String?> getVersion();
  Future<bool> appVersionIsOutdated();
}