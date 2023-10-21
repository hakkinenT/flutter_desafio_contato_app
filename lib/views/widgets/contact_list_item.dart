import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/entities/contact.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: Image.file(File(contact.photo)).image,
      ),
      title: Text(contact.name),
    );
  }
}
