import 'package:flutter/material.dart';

import '../../models/contact.dart';
import 'contact_list_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactListItem(contact: contacts[index]);
      },
    );
  }
}
