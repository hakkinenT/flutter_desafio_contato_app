import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/camera_controller.dart';
import '../../../controllers/contact_controller.dart';
import '../../../controllers/register_contact_page_view_controller.dart';
import '../../../models/contact_model.dart';
import '../../widgets/avatar_photo.dart';
import '../../widgets/custom_snack_bar.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/directional_button_controll_panel.dart';
import '../../widgets/finish_button.dart';
import '../../widgets/page_title.dart';
import '../../widgets/previous_button.dart';

class PhotoData extends StatelessWidget {
  const PhotoData({super.key});

  @override
  Widget build(BuildContext context) {
    final pageViewController =
        Provider.of<RegisterContactPageViewController>(context, listen: false);
    final cameraController =
        Provider.of<CameraController>(context, listen: false);
    final contactModel = Provider.of<ContactModel>(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Consumer<CameraController>(builder: (_, camera, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(title: 'Foto do Contato'),
            const SizedBox(
              height: 32,
            ),
            const ContactAvatar(),
            const SizedBox(
              height: 24,
            ),
            _TakeAPhotoButton(
              onPressed: () async => cameraController.takeAPhoto(),
            ),
            const SizedBox(
              height: 16,
            ),
            _OpenGalleryButton(
                onPressed: () async => cameraController.getPhotoFromGallery()),
            const SizedBox(
              height: 180,
            ),
            DirectionalButtonControllPanel(
              children: [
                PreviousButton(
                    onPressed: () => pageViewController.previousPage()),
                Consumer<CameraController>(
                  builder: (_, camera, __) {
                    return FinishButton(
                        onPressed: camera.photoPath != null ||
                                camera.cropPhotoPath != null
                            ? () async => _onFinishButtonPressed(
                                context, camera, contactModel)
                            : null);
                  },
                )
              ],
            )
          ],
        );
      }),
    );
  }

  Future<void> _onFinishButtonPressed(BuildContext context,
      CameraController camera, ContactModel contactModel) async {
    final controller = Provider.of<ContactController>(context, listen: false);
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    _setPhoto(camera, contactModel);

    await controller.save(contactModel);

    if (controller.error) {
      scaffoldMessenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          errorSnackBar(message: controller.errorMessage!),
        );
    } else {
      scaffoldMessenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          successSnackBar(message: 'Contato cadastrado com sucesso!'),
        );
    }
    await controller.getAll();

    navigator.pop();
  }
}

void _setPhoto(CameraController camera, ContactModel contactModel) {
  if (camera.photoPath != null && camera.cropPhotoPath == null) {
    contactModel.setPhoto(camera.photoPath!);
  } else {
    contactModel.setPhoto(camera.cropPhotoPath!);
  }
}

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
          radius: 60,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const _ContactPhoto()),
    );
  }
}

class _ContactPhoto extends StatelessWidget {
  const _ContactPhoto();

  @override
  Widget build(BuildContext context) {
    return Consumer<CameraController>(
      builder: (_, camera, __) {
        if (camera.cropPhotoPath != null) {
          return AvatarPhoto(
            radius: 55,
            fileName: camera.cropPhotoPath!,
          );
        } else if (camera.cropPhotoPath == null && camera.photoPath != null) {
          return AvatarPhoto(
            radius: 55,
            fileName: camera.photoPath!,
          );
        }
        return const _EmptyAvatarPhoto();
      },
    );
  }
}

class _EmptyAvatarPhoto extends StatelessWidget {
  const _EmptyAvatarPhoto();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: const Icon(
        Icons.person,
        size: 100,
        color: Colors.grey,
      ),
    );
  }
}

class _TakeAPhotoButton extends StatelessWidget {
  const _TakeAPhotoButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      label: 'Tirar foto',
      onPressed: onPressed,
    );
  }
}

class _OpenGalleryButton extends StatelessWidget {
  const _OpenGalleryButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      label: 'Abrir Galeria',
      onPressed: onPressed,
    );
  }
}
