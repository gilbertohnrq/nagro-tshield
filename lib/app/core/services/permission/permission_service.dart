// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionService {
  Future<bool> requestPermission(Permission permission);
  Future<bool> isPermissionGranted(Permission permission);
  Future<bool> isCameraPermissionGranted();
  Future<bool> isLocationPermissionGranted();
  Future<bool> requestCameraPermission(BuildContext context);
  Future<bool> requestLocationPermission(BuildContext context);
  Future<bool> openLocationSettings();
  Future<bool> openCameraSettings();
  Future<bool> openNotificationSettings();
  Future<bool> checkLocationPermission();
  Future<bool> checkCameraPermission();
  Future<bool> checkNotificationPermission();
  Future<void> goToSettings();
  Future<List<String>> getPermissionsStatus();
}
