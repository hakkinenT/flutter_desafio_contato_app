import 'package:flutter_desafio_contato_app/models/contact.dart';

abstract interface class ContactRepository {
  Future<void> save(Contact contact);
  Future<List<Contact>> getAll();
  Future<void> update(Contact contact);
  Future<void> remove(String id);
}
