import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Payment {
  final bool digital;
  final bool cod;
  Payment({
    required this.digital,
    required this.cod,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'digital': digital,
      'cod': cod,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      digital: map['digital'] as bool,
      cod: map['cod'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) => Payment.fromMap(json.decode(source) as Map<String, dynamic>);
}
