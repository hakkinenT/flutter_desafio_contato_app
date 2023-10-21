import 'package:flutter/material.dart';

import '../../models/entities/contact.dart';
import 'contact_list_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: contacts.length,
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      itemBuilder: (context, index) {
        return ContactListItem(contact: contacts[index]);
      },
    );
  }
}
