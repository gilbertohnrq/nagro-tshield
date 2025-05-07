// coverage:ignore-file
import 'package:finan/app/core/services/local_data/local_data_service.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class LocalDataServiceImpl extends ILocalDataService {
  @override
  Future<String?> get(String keyName) async {
    return await FlutterKeychain.get(key: keyName);
  }

  @override
  Future<void> remove(String keyName) async {
    await FlutterKeychain.remove(key: keyName);
  }

  @override
  Future<void> save(String keyName, String data) async {
    await FlutterKeychain.put(key: keyName, value: data);
  }
}
