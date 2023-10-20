import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_contact_page_view_controller.dart';
import '../../widgets/directional_button_controll_panel.dart';
import '../../widgets/finish_button.dart';
import '../../widgets/previous_button.dart';

class PhotoData extends StatelessWidget {
  const PhotoData({super.key});

  @override
  Widget build(BuildContext context) {
    final pageViewController =
        Provider.of<RegisterContactPageViewController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Theme.of(context).colorScheme.background,
              child: const Icon(
                Icons.person,
                size: 100,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Tirar Foto',
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
          const SizedBox(
            height: 250,
          ),
          DirectionalButtonControllPanel(
            children: [
              PreviousButton(
                  onPressed: () => pageViewController.previousPage()),
              FinishButton(onPressed: () => {}),
            ],
          )
        ],
      ),
    );
  }
}
