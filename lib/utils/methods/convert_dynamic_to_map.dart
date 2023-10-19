Map<String, dynamic> convertDynamicToMap(dynamic data) {
  Map<String, dynamic> map = {
    'objectId': data['objectId'],
    'name': data['nome'],
    'birthDate': data['dataNascimento']['iso'],
    'photo': data['foto'],
    'phone': data['telefone'],
    'place': data['logradouro'],
    'number': data['numero'],
    'neighborhood': data['bairro'],
    'city': data['cidade'],
    'state': data['Estado']
  };

  return map;
}
