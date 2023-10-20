import 'package:flutter/material.dart';

import '../../models/entities/contact.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(contact.name),
    );
  }
}
