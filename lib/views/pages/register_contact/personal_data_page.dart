import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_contact_page_view_controller.dart';
import '../../../models/contact_model.dart';
import '../../widgets/contact_form_field.dart';
import '../../widgets/next_button.dart';
import '../../widgets/page_title.dart';
import 'register_contact_item_page_body.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageViewController =
        Provider.of<RegisterContactPageViewController>(context, listen: false);

    return RegisterContactItemPageBody(
      children: [
        const PageTitle(title: 'Dados Pessoais'),
        const SizedBox(
          height: 24,
        ),
        const _NameInput(),
        const SizedBox(
          height: 16,
        ),
        const _BirthDateInput(),
        const SizedBox(
          height: 16,
        ),
        const _PhoneInput(),
        const SizedBox(
          height: 30,
        ),
        _GoToNextPage(
          onPressed: () => pageViewController.nextPage(),
        )
      ],
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return ContactFormField(
        label: 'Nome',
        hintText: 'John Doe',
        onChanged: model.setName,
        preffixIcon: const Icon(Icons.person),
        validator: (_) {
          if (model.nameError != null) {
            return model.nameError!;
          }
          return null;
        },
      );
    });
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return ContactFormField(
        label: 'Telefone',
        hintText: '(79) 9999-9999',
        onChanged: model.setPhone,
        preffixIcon: const Icon(Icons.phone_android),
        validator: (_) {
          if (model.phoneError != null) {
            return model.phoneError!;
          }
          return null;
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ],
      );
    });
  }
}

class _BirthDateInput extends StatelessWidget {
  const _BirthDateInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return ContactFormField(
        label: 'Data de Nascimento (Opcional)',
        hintText: '22/10/1980',
        onChanged: model.setBirthDate,
        preffixIcon: const Icon(Icons.calendar_month),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          DataInputFormatter(),
        ],
      );
    });
  }
}

class _GoToNextPage extends StatelessWidget {
  const _GoToNextPage({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return NextButton(
        onPressed: model.isValidate ? onPressed : null,
      );
    });
  }
}
