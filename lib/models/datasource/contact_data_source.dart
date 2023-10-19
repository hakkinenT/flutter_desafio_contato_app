abstract interface class ContactDataSource {
  Future<void> save(Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getAll();
  Future<void> update(String id, Map<String, dynamic> data);
  Future<void> remove(String id);
}
