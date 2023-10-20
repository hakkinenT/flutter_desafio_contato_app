import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class Camera {
  //* Tira uma foto e retorna o path da mesma
  Future<String?> takeAPhoto() async {
    XFile? photo;
    final ImagePicker picker = ImagePicker();

    photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      String path =
          (await path_provider.getApplicationDocumentsDirectory()).path;
      String name = basename(photo.path);
      await photo.saveTo('$path/$name');
    }

    return photo?.path;
  }

  //* Corta uma foto e retorna o path da foto recortada
  Future<String?> cropImage(String path) async {
    XFile? photo;

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: const Color(0xFF315DA8),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      photo = XFile(croppedFile.path);
    }
    return photo?.path;
  }

  //* Salva a foto na galeria
  Future<void> saveOnGallery(String path) async {
    await GallerySaver.saveImage(path);
  }

  Future<String?> getPhotoFromGallery() async {
    XFile? photo;
    final ImagePicker picker = ImagePicker();
    photo = await picker.pickImage(source: ImageSource.gallery);

    return photo?.path;
  }
}
