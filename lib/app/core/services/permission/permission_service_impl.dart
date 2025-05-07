// coverage:ignore-file

import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:finan/app/core/services/settings/settings_service.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionServiceImpl implements IPermissionService {
  final ISettingsService _settingsService;

  PermissionServiceImpl(this._settingsService);

  @override
  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }

  @override
  Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  @override
  Future<bool> isCameraPermissionGranted() async {
    return isPermissionGranted(Permission.camera);
  }

  @override
  Future<bool> isLocationPermissionGranted() async {
    return isPermissionGranted(Permission.location);
  }

  @override
  Future<bool> requestCameraPermission(BuildContext context) async {
    final bool cameraGranted = await requestPermission(Permission.camera);

    if (!cameraGranted && context.mounted) {
      _showPermissionDialog(
        context,
        permissaoDeCameraObrigatoria,
        habilitarPermissaoDeCameraNasConfiguracoes,
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> requestLocationPermission(BuildContext context) async {
    final bool locationGranted = await requestPermission(Permission.location);

    if (!locationGranted && context.mounted) {
      _showPermissionDialog(
        context,
        permissaoDeLocalizacaoObrigatoria,
        habilitarPermissaoDeLocalizacaoNasConfiguracoes,
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> openLocationSettings() async {
    await _settingsService.openLocationSettings();
    return checkLocationPermission();
  }

  @override
  Future<bool> openCameraSettings() async {
    await _settingsService.openCameraSettings();
    return checkCameraPermission();
  }

  @override
  Future<bool> openNotificationSettings() async {
    await _settingsService.openNotificationSettings();
    return checkNotificationPermission();
  }

  @override
  Future<bool> checkLocationPermission() async {
    return isLocationPermissionGranted();
  }

  @override
  Future<bool> checkCameraPermission() async {
    return isCameraPermissionGranted();
  }

  @override
  Future<bool> checkNotificationPermission() async {
    return isPermissionGranted(Permission.notification);
  }

  @override
  Future<void> goToSettings() async {
    await _settingsService.openSettings();
  }

  void _showPermissionDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: ThemeTypography.sub1.copyWith(
            color: ThemeColors.kTextBase,
          ),
        ),
        content: Text(
          content,
          style: ThemeTypography.sub2.copyWith(
            color: ThemeColors.kTextLight,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              cancelar,
              style: TextStyle(
                color: ThemeColors.kTextLight,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text(
              abrirConfiguracoes,
              style: TextStyle(
                color: ThemeColors.kPrimary,
              ),
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              await _settingsService.openSettings();
            },
          ),
        ],
      ),
    );
  }

  @override
  Future<List<String>> getPermissionsStatus() async {
    final List<String> permissions = [];
    final List<Future<PermissionStatus>> permissionStatusFutures = [
      Permission.camera.status,
      Permission.location.status,
      Permission.notification.status,
    ];

    final List<PermissionStatus> permissionStatuses =
        await Future.wait(permissionStatusFutures);

    if (permissionStatuses[0].isGranted) {
      permissions.add(cameraPermissionKey);
    }
    if (permissionStatuses[1].isGranted) {
      permissions.add(locationPermissionKey);
    }
    if (permissionStatuses[2].isGranted) {
      permissions.add(notificationPermissionKey);
    }

    return permissions;
  }
}
