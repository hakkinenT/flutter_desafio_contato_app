import 'package:flutter_desafio_contato_app/models/contact.dart';
import 'package:flutter_desafio_contato_app/models/datasource/contact_data_source.dart';
import 'package:flutter_desafio_contato_app/models/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactDataSource contactDataSource;

  const ContactRepositoryImpl({required this.contactDataSource});

  @override
  Future<List<Contact>> getAll() async {
    final result = await contactDataSource.getAll();
    return result.map((contact) => Contact.fromJson(contact)).toList();
  }

  @override
  Future<void> remove(String id) async {
    await contactDataSource.remove(id);
  }

  @override
  Future<void> save(Contact contact) async {
    await contactDataSource.save(contact.toJson());
  }

  @override
  Future<void> update(Contact contact) async {
    await contactDataSource.update(contact.objectId!, contact.toJson());
  }
}
