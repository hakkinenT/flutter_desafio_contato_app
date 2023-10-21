import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/controllers/camera_controller.dart';
import 'package:flutter_desafio_contato_app/controllers/register_contact_page_view_controller.dart';
import 'package:flutter_desafio_contato_app/models/contact_model.dart';
import 'package:flutter_desafio_contato_app/views/pages/register_contact/register_page_view_items.dart';
import 'package:provider/provider.dart';

class RegisterContactPage extends StatelessWidget {
  const RegisterContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => RegisterContactPageViewController()),
        ChangeNotifierProvider(create: (_) => ContactModel()),
        ChangeNotifierProvider(create: (_) => CameraController())
      ],
      child: const RegisterContactView(),
    );
  }
}

class RegisterContactView extends StatefulWidget {
  const RegisterContactView({super.key});

  @override
  State<RegisterContactView> createState() => _RegisterContactViewState();
}

class _RegisterContactViewState extends State<RegisterContactView> {
  final PageController pageController = PageController();
  late final RegisterContactPageViewController pageViewController;

  @override
  void initState() {
    super.initState();
    pageViewController =
        Provider.of<RegisterContactPageViewController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Contato'),
      ),
      body: Consumer<RegisterContactPageViewController>(
          builder: (_, controller, __) {
        final actualPage = controller.actualPage;

        return PageView.builder(
          pageSnapping: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pages.length,
          controller: pageController,
          onPageChanged: (index) => controller.onPageChanged(index),
          itemBuilder: (_, __) => pages[actualPage],
        );
      }),
    );
  }
}
