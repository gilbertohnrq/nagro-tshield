// coverage:ignore-file
abstract class ISettingsService {
  Future<void> openSettings();
  Future<void> openBatterySettings();
  Future<void> openLocationSettings();
  Future<void> openCameraSettings();
  Future<void> openNotificationSettings();
}
