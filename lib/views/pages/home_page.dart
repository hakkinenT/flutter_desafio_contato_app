import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/controllers/contact_controller.dart';
import 'package:provider/provider.dart';

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
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.contacts.isEmpty) {
      return const EmptyContact();
    } else if (state.error) {
      return Center(
        child: Text(state.errorMessage!),
      );
    }
    return ListView.builder(
        itemCount: state.contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(state.contacts[index].name),
          );
        });
  }
}
