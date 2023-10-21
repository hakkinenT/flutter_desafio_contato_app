import 'package:flutter/material.dart';

SnackBar successSnackBar({String message = 'Item cadastrado com sucesso!'}) {
  return SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      message,
    ),
  );
}

SnackBar errorSnackBar({String message = 'Erro ao adicionar o Contato'}) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
  );
}
