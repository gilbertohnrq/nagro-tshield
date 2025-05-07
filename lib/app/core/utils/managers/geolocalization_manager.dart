// coverage:ignore-file
import 'package:finan/app/core/services/permission/permission_service.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocalizationManager {
  final IPermissionService permissionService;

  GeoLocalizationManager({required this.permissionService});

  Future<bool> checkAndRequestLocationPermissions() async {
    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return false;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Position?> getCurrentPosition() async {
    try {
      final bool permissionsGranted =
          await checkAndRequestLocationPermissions();
      if (!permissionsGranted) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 30),
        ),
      );
    } catch (e) {
      return null;
    }
  }
}
