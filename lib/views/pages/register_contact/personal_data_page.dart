import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_contact_page_view_controller.dart';
import '../../widgets/contact_form_field.dart';
import '../../widgets/next_button.dart';
import 'register_contact_item_page_body.dart';

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
        ContactFormField(
          label: 'Data de Nascimento',
          hintText: '22/10/1980',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            DataInputFormatter(),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ContactFormField(
          label: 'Telefone',
          hintText: '(79) 9999-9999',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TelefoneInputFormatter(),
          ],
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
