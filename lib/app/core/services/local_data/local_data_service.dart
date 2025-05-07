// coverage:ignore-file
abstract class ILocalDataService {
  Future<void> save(String keyName, String data);
  Future<String?> get(String keyName);
  Future<void> remove(String keyName);
}
