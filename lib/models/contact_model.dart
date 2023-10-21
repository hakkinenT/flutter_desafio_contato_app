import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/models/entities/contact.dart';

class ContactModel extends ChangeNotifier {
  String? objectId;
  String name = '';
  DateTime? birthDate;
  String photo = '';
  String phone = '';
  String? place = '';
  String? number = '';
  String? neighborhood = '';
  String? city;
  String? state;
  bool isValidate = false;
  String? nameError;
  String? phoneError;

  void setObjectId(String objectId) {
    this.objectId = objectId;

    notifyListeners();
  }

  void setName(String name) {
    if (name.isEmpty) {
      isValidate = false;
      nameError = 'O campo Nome é obrigatório';
    } else if (name.isNotEmpty && phone.isNotEmpty) {
      isValidate = true;
      nameError = null;
    }
    this.name = name;
    notifyListeners();
  }

  void setPhone(String phone) {
    if (phone.isEmpty) {
      isValidate = false;
      phoneError = 'O campo Telefone é obrigatório';
    } else if (phone.length < 14 || phone.length > 15) {
      isValidate = false;
      phoneError = 'Informe um número de telefone válido';
    } else {
      isValidate = true;
      nameError = null;
    }
    this.phone = phone;
    notifyListeners();
  }

  void setPhoto(String photo) {
    this.photo = photo;
    notifyListeners();
  }

  void setBirthDate(String birthDate) {
    String birthDateFormatted = _formatData(birthDate);
    if (birthDateFormatted.length == 10) {
      this.birthDate = DateTime.parse(birthDateFormatted);
    }
    notifyListeners();
  }

  void setPlace(String place) {
    this.place = place;
    notifyListeners();
  }

  void setNumber(String number) {
    this.number = number;
    notifyListeners();
  }

  void setNeighborhood(String neighborhood) {
    this.neighborhood = neighborhood;
    notifyListeners();
  }

  void setCity(String city) {
    this.city = city;
    notifyListeners();
  }

  void setState(String state) {
    this.state = state;
    notifyListeners();
  }

  String _formatData(String value) {
    final createDate = value.split('/');
    final inverseDate = createDate.reversed.toList();
    final newDate = inverseDate.toSet().join('-');
    return newDate;
  }

  Contact mapToEntity() {
    return Contact(
      objectId: objectId,
      name: name,
      photo: photo,
      phone: phone,
      birthDate: birthDate,
      place: place,
      number: number,
      neighborhood: neighborhood,
      city: city,
      state: state,
    );
  }
}
