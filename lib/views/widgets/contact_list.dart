import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/contact_controller.dart';
import '../../models/entities/contact.dart';
import 'contact_list_item.dart';
import 'custom_snack_bar.dart';

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
          onDeleteButtonPressed: () async =>
              _onDeleteButtonPressed(context, contacts[index]),
        );
      },
    );
  }

  Future<void> _onDeleteButtonPressed(
      BuildContext context, Contact contact) async {
    final controller = Provider.of<ContactController>(context, listen: false);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await controller.remove(contact.objectId!);

    if (controller.error) {
      scaffoldMessenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          errorSnackBar(message: controller.errorMessage!),
        );
    } else {
      scaffoldMessenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          successSnackBar(message: 'Contato removido com sucesso!'),
        );
    }
    await controller.getAll();
  }
}
