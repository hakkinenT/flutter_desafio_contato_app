import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/models/contact_model.dart';
import 'package:flutter_desafio_contato_app/models/repositories/contact_repository.dart';
import 'package:provider/provider.dart';

import '../../../controllers/camera_controller.dart';
import '../../../controllers/contact_controller.dart';
import '../../../controllers/register_contact_page_view_controller.dart';
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
      child: Column(
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
                          ? () async {
                              final controller = Provider.of<ContactController>(
                                  context,
                                  listen: false);

                              if (camera.photoPath != null) {
                                contactModel.setPhoto(camera.photoPath!);
                              } else {
                                contactModel.setPhoto(camera.cropPhotoPath!);
                              }

                              await controller.save(contactModel);
                              await controller.getAll();
                              Navigator.pop(context);
                            }
                          : null);
                },
              )
            ],
          )
        ],
      ),
    );
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
          return _AvatarPhoto(
            fileName: camera.cropPhotoPath!,
          );
        } else if (camera.cropPhotoPath == null && camera.photoPath != null) {
          return _AvatarPhoto(
            fileName: camera.photoPath!,
          );
        }
        return const _EmptyAvatarPhoto();
      },
    );
  }
}

class _AvatarPhoto extends StatelessWidget {
  const _AvatarPhoto({required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundImage: Image.file(File(fileName)).image,
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
