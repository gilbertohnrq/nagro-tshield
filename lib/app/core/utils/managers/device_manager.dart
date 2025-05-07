// coverage:ignore-file
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceManager {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late AndroidDeviceInfo androidInfo;
  late IosDeviceInfo iosDeviceInfo;

  DeviceManager() {
    setUpPlataform();
  }

  Future<void> setUpPlataform() async {
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceInfo.iosInfo;
    }
  }

  Future<String?> getDeviceUUID() async {
    setUpPlataform();
    if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id; // unique ID on Android
    }
    return null;
  }

  Future<String> getPlataform() async {
    setUpPlataform();
    if (Platform.isAndroid) {
      return 'Android';
    } else {
      return 'Ios';
    }
  }

  Future<String> getManufacturer() async {
    setUpPlataform();
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      return androidInfo.manufacturer;
    } else {
      iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.utsname.machine;
    }
  }

  Future<String> getDeviceModel() async {
    setUpPlataform();
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else {
      iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.model;
    }
  }

  Future<String> getIPv4Address() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var address in interface.addresses) {
          if (address.type == InternetAddressType.IPv4 && !address.isLoopback) {
            return address.address;
          }
        }
      }
    } catch (e) {
      log('Erro ao obter endereço IP: $e');
    }
    return 'Endereço de IPv4 não encontrado';
  }
}
