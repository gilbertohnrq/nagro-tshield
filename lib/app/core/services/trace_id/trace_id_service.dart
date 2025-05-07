// coverage:ignore-file
abstract class ITraceIdService {
  Future<void> generateHash();
  Future<String?> generateTraceid();
}