import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/views/widgets/next_button.dart';
import 'package:flutter_desafio_contato_app/views/widgets/previous_button.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_contact_page_view_controller.dart';
import '../../widgets/contact_form_field.dart';
import '../../widgets/directional_button_controll_panel.dart';
import 'register_contact_item_page_body.dart';

class AddressData extends StatelessWidget {
  const AddressData({super.key});

  @override
  Widget build(BuildContext context) {
    final pageViewController =
        Provider.of<RegisterContactPageViewController>(context, listen: false);

    return RegisterContactItemPageBody(
      children: [
        const ContactFormField(
          label: 'Logradouro',
          hintText: 'Rua A',
        ),
        const SizedBox(
          height: 16,
        ),
        const ContactFormField(
          label: 'Número',
          hintText: '1980',
        ),
        const SizedBox(
          height: 16,
        ),
        const ContactFormField(
          label: 'Bairro',
          hintText: 'Centro',
        ),
        const SizedBox(
          height: 16,
        ),
        const ContactFormField(
          label: 'Cidade',
          hintText: 'São Paulo',
        ),
        const SizedBox(
          height: 16,
        ),
        const ContactFormField(
          label: 'Estado',
          hintText: 'São Paulo',
        ),
        const SizedBox(
          height: 30,
        ),
        DirectionalButtonControllPanel(
          children: [
            PreviousButton(onPressed: () => pageViewController.previousPage()),
            NextButton(onPressed: () => pageViewController.nextPage()),
          ],
        )
      ],
    );
  }
}
