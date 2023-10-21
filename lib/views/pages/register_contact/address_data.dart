import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_contact_page_view_controller.dart';
import '../../../models/contact_model.dart';
import '../../widgets/contact_form_field.dart';
import '../../widgets/directional_button_controll_panel.dart';
import '../../widgets/next_button.dart';
import '../../widgets/page_title.dart';
import '../../widgets/previous_button.dart';
import 'register_contact_item_page_body.dart';

class AddressData extends StatelessWidget {
  const AddressData({super.key});

  @override
  Widget build(BuildContext context) {
    final pageViewController =
        Provider.of<RegisterContactPageViewController>(context, listen: false);

    return RegisterContactItemPageBody(
      children: [
        const PageTitle(title: 'Endereço (Opcional)'),
        const SizedBox(
          height: 24,
        ),
        const _PlaceInput(),
        const SizedBox(
          height: 16,
        ),
        const _NumberInput(),
        const SizedBox(
          height: 16,
        ),
        const _NeighborhoodInput(),
        const SizedBox(
          height: 16,
        ),
        const _CityInput(),
        const SizedBox(
          height: 16,
        ),
        const _StateInput(),
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

class _PlaceInput extends StatelessWidget {
  const _PlaceInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return ContactFormField(
        label: 'Logradouro',
        hintText: 'Rua A',
        onChanged: model.setPlace,
        preffixIcon: const Icon(Icons.place),
      );
    });
  }
}

class _NumberInput extends StatelessWidget {
  const _NumberInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return ContactFormField(
        label: 'Número',
        hintText: '1980',
        onChanged: model.setNumber,
        preffixIcon: const Icon(Icons.onetwothree),
      );
    });
  }
}

class _NeighborhoodInput extends StatelessWidget {
  const _NeighborhoodInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(
      builder: (_, model, __) {
        return ContactFormField(
          label: 'Bairro',
          hintText: 'Centro',
          onChanged: model.setNeighborhood,
          preffixIcon: const Icon(Icons.holiday_village),
        );
      },
    );
  }
}

class _CityInput extends StatelessWidget {
  const _CityInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return ContactFormField(
        label: 'Cidade',
        hintText: 'São Paulo',
        onChanged: model.setCity,
        preffixIcon: const Icon(Icons.location_city),
      );
    });
  }
}

class _StateInput extends StatelessWidget {
  const _StateInput();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactModel>(builder: (_, model, __) {
      return ContactFormField(
        label: 'Estado',
        hintText: 'São Paulo',
        onChanged: model.setState,
        preffixIcon: const Icon(Icons.map),
      );
    });
  }
}
