// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final String id;
  final String house;
  final String street;
  final String city;
  final String pinCode;

  Address({required this.id, required this.house, required this.street, required this.city, required this.pinCode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'house_name': house,
      'street_name': street,
      'city_name': city,
      'pin_code': pinCode,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['_id'] as String,
      house: map['house_name'] as String,
      street: map['street_name'] as String,
      city: map['city_name'] as String,
      pinCode: map['pin_code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
