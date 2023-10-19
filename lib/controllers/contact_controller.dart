import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/models/contact.dart';
import 'package:flutter_desafio_contato_app/models/repositories/contact_repository.dart';

import '../models/exceptions/data_source_exception.dart';

class ContactController extends ChangeNotifier {
  final ContactRepository repository;

  ContactController({required this.repository});

  bool loading = false;
  bool error = false;
  String? errorMessage;
  List<Contact> contacts = [];

  Future<void> getAll() async {
    try {
      _showLoadingProgress();

      contacts = await repository.getAll();

      _hidenLoadingProgress();
    } on DataSourceException catch (e) {
      _onError(e.toString());
    }

    _clearStates();
    notifyListeners();
  }

  _showLoadingProgress() {
    loading = true;
  }

  _hidenLoadingProgress() {
    loading = false;
  }

  _onError(String errorMessage) {
    error = true;
    this.errorMessage = errorMessage;
  }

  void _clearStates() {
    error = false;
    errorMessage;
  }
}
