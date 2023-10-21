import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/views/widgets/avatar_photo.dart';

import '../../models/entities/contact.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: AvatarPhoto(
            radius: 30,
            fileName: contact.photo,
          ),
          title: Text(contact.name),
        ),
      ),
    );
  }
}
