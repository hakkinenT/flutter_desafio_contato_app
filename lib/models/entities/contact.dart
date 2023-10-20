class Contact {
  final String? objectId;
  final String name;
  final DateTime? birthDate;
  final String photo;
  final String phone;
  final String? place;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? state;

  Contact({
    required this.name,
    required this.photo,
    required this.phone,
    this.objectId,
    this.birthDate,
    this.place,
    this.number,
    this.neighborhood,
    this.city,
    this.state,
  });

  factory Contact.empty() => Contact(name: '', photo: '', phone: '');

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        objectId: json['objectId'],
        name: json['name'],
        photo: json['photo'],
        phone: json['phone'],
        birthDate: json['birthDate'] != null
            ? DateTime.parse(json['birthDate']).toLocal()
            : json['birthDate'],
        place: json['place'],
        number: json['number'],
        neighborhood: json['neighborhood'],
        city: json['city'],
        state: json['state']);
  }

  Map<String, dynamic> toJson() => {
        'nome': name,
        'telefone': phone,
        'dataNascimento': {'__type': 'Date', 'iso': '$birthDate'},
        'foto': photo,
        'logradouro': place,
        'numero': number,
        'bairro': neighborhood,
        'cidade': city,
        'estado': state
      };

  Contact copyWith({
    String? objectId,
    String? name,
    String? phone,
    String? photo,
    DateTime? birthDate,
    String? place,
    String? number,
    String? neighborhood,
    String? city,
    String? state,
  }) {
    return Contact(
      objectId: objectId ?? this.objectId,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
      place: place ?? this.place,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }
}
