// coverage:ignore-file
import 'package:finan/app/core/services/settings/settings_service.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:open_settings_plus/open_settings_plus.dart';

class SettingsServiceImpl implements ISettingsService {
  final _settings = OpenSettingsPlus.shared;

  @override
  Future<void> openSettings() async {
    switch (_settings) {
      case final OpenSettingsPlusAndroid android:
        await android.appSettings();
      case final OpenSettingsPlusIOS ios:
        await ios.appSettings();
      case _:
        throw Exception(platformNotSupported);
    }
  }

  @override
  Future<void> openBatterySettings() async {
    switch (_settings) {
      case final OpenSettingsPlusAndroid android:
        await android.batterySaver();
      case final OpenSettingsPlusIOS ios:
        await ios.battery();
      case _:
        throw Exception(platformNotSupported);
    }
  }

  @override
  Future<void> openLocationSettings() async {
    switch (_settings) {
      case final OpenSettingsPlusAndroid android:
        await android.locationSource();
      case final OpenSettingsPlusIOS ios:
        await ios.appSettings();
      case _:
        throw Exception(platformNotSupported);
    }
  }

  @override
  Future<void> openCameraSettings() async {
    switch (_settings) {
      case final OpenSettingsPlusAndroid android:
        await android.appSettings();
      case final OpenSettingsPlusIOS ios:
        await ios.appSettings();
      case _:
        throw Exception(platformNotSupported);
    }
  }

  @override
  Future<void> openNotificationSettings() async {
    switch (_settings) {
      case final OpenSettingsPlusAndroid android:
        await android.appNotification();
      case final OpenSettingsPlusIOS ios:
        await ios.appSettings();
      case _:
        throw Exception(platformNotSupported);
    }
  }
}
