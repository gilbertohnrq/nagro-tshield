// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetAddressResponse {
  String zipCode;
  String street;
  String? complement;
  String neighborhood;
  String city;
  String state;

  GetAddressResponse({
    this.zipCode = '',
    this.street = '',
    this.complement,
    this.neighborhood = '',
    this.city = '',
    this.state = '',
  });


  GetAddressResponse copyWith({
    String? zipCode,
    String? street,
    String? complement,
    String? neighborhood,
    String? city,
    String? state,
  }) {
    return GetAddressResponse(
      zipCode: zipCode ?? this.zipCode,
      street: street ?? this.street,
      complement: complement ?? this.complement,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'zipCode': zipCode,
      'street': street,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state
    };
  }

  factory GetAddressResponse.fromMap(Map<String, dynamic> map) {
    return GetAddressResponse(
      zipCode: map['cep'],
      street: map['logradouro'],
      complement: map['complemento'],
      neighborhood: map['bairro'],
      city: map['localidade'],
      state: map['uf'],
    );
  }

  factory GetAddressResponse.mocked({
    String? zipCode,
    String? street,
    String? complement,
    String? neighborhood,
    String? city,
    String? state,
  }) {
    return GetAddressResponse(
      zipCode: zipCode ?? '12345678',
      street: street ?? 'Rua Exemplo',
      complement: complement ?? 'Apto 101',
      neighborhood: neighborhood ?? 'Bairro Exemplo',
      city: city ?? 'Cidade Exemplo',
      state: state ?? 'EX',
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAddressResponse.fromJson(String source) => GetAddressResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetAddressResponse(zipCode: $zipCode, street: $street, complement: $complement, neighborhood: $neighborhood, city: $city, state: $state)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetAddressResponse &&
        other.zipCode == zipCode &&
        other.street == street &&
        other.complement == complement &&
        other.neighborhood == neighborhood &&
        other.city == city &&
        other.state == state;
  }

  @override
  int get hashCode => zipCode.hashCode ^
  street.hashCode ^
  complement.hashCode ^
  neighborhood.hashCode ^
  city.hashCode ^
  state.hashCode;
}
