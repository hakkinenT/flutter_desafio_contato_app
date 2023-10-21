import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/controllers/contact_controller.dart';
import 'package:provider/provider.dart';

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
        return ContactListItem(
          contact: contacts[index],
          onDeleteButtonPressed: () async {
            final controller =
                Provider.of<ContactController>(context, listen: false);
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            final theme = Theme.of(context);

            await controller.remove(contacts[index].objectId!);

            if (controller.error) {
              scaffoldMessenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    backgroundColor: theme.colorScheme.error,
                    content: Text(controller.errorMessage!),
                  ),
                );
            } else {
              scaffoldMessenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Contato removido com sucesso!',
                    ),
                  ),
                );
            }
            await controller.getAll();
          },
        );
      },
    );
  }
}
