import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/contact_controller.dart';
import '../widgets/contact_list.dart';
import '../widgets/contact_loading_progress.dart';
import '../widgets/empty_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ContactController contactController;

  @override
  void initState() {
    super.initState();
    contactController = Provider.of<ContactController>(context, listen: false);
    _getContacts();
  }

  _getContacts() async {
    await contactController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: const _HomePageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ContactController>();

    if (state.loading) {
      return const ContactLoadingProgress();
    } else if (state.contacts.isEmpty) {
      return const EmptyContact();
    } else if (state.error) {
      return Center(
        child: Text(state.errorMessage!),
      );
    }
    return ContactList(contacts: state.contacts);
  }
}