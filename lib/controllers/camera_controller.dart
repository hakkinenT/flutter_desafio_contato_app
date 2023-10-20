import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/utils/camera/camera.dart';

class CameraController extends ChangeNotifier {
  Camera camera = Camera();

  String? photoPath;
  String? cropPhotoPath;
  String? galleryPhotoPath;

  Future<void> takeAPhoto() async {
    photoPath = await camera.takeAPhoto();
    await _saveOnGallery(photoPath);
    if (photoPath != null) {
      cropPhotoPath = await camera.cropImage(photoPath!);
      await _saveOnGallery(cropPhotoPath);
    }
    notifyListeners();
  }

  Future<void> getPhotoFromGallery() async {
    galleryPhotoPath = await camera.getPhotoFromGallery();
    if (galleryPhotoPath != null) {
      cropPhotoPath = await camera.cropImage(galleryPhotoPath!);
      await _saveOnGallery(cropPhotoPath);
    }
    notifyListeners();
  }

  Future<void> _saveOnGallery(String? path) async {
    if (path != null) {
      await camera.saveOnGallery(path);
    }
  }
}
