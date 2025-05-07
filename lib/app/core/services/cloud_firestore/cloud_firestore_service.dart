// coverage:ignore-file
//coverage:ignore-file

abstract class CloudFirestoreService<T> {
  Future<void> create(String collectionPath, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> read(String collectionPath, String id);
  Future<void> update(String collectionPath, String id, Map<String, dynamic> data);
  Future<void> delete(String collectionPath, String id);
  Future<List<Map<String, dynamic>>> list(String collectionPath, String tag);
}