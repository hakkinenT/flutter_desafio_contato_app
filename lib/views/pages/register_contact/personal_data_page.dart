import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/views/pages/register_contact/register_contact_item_page_body.dart';
import 'package:flutter_desafio_contato_app/views/widgets/next_button.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_contact_page_view_controller.dart';
import '../../widgets/contact_form_field.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageViewController =
        Provider.of<RegisterContactPageViewController>(context, listen: false);

    return RegisterContactItemPageBody(
      children: [
        const ContactFormField(
          label: 'Nome',
          hintText: 'John Doe',
        ),
        const SizedBox(
          height: 16,
        ),
        const ContactFormField(
          label: 'Data de Nascimento',
          hintText: '22/10/1980',
        ),
        const SizedBox(
          height: 16,
        ),
        const ContactFormField(
          label: 'Telefone',
          hintText: '(79) 9999-9999',
        ),
        const SizedBox(
          height: 30,
        ),
        NextButton(
          onPressed: () => pageViewController.nextPage(),
        )
      ],
    );
  }
}
