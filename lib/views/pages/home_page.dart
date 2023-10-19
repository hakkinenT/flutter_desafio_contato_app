import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/controllers/contact_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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

class EmptyContact extends StatelessWidget {
  const EmptyContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dx = size.width / 2;
    final dy = size.height / 2;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Align(
        alignment: Alignment(dx, dy),
        child: Column(
          children: [
            Lottie.asset('assets/images/contact.json',
                width: 380, height: 250, fit: BoxFit.fitWidth),
            Text(
              'Ainda não há Contatos cadastrados.',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text.rich(
              TextSpan(
                  text: 'Clique em',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: ' + ',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'para começar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
