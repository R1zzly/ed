import 'dart:convert';

import 'address.dart';
import 'order.dart';
import 'product.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String token;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Product>? cart;
  final List<Address>? addresses;
  final List<Order>? orders;

  const User({required this.id, required this.firstName, required this.lastName, required this.email, required this.phone, required this.token, required this.refreshToken, required this.createdAt, required this.updatedAt, this.cart, required this.addresses, required this.orders});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'token': token,
      'refresh_token': refreshToken,
      'cart': cart?.map((x) => x.toMap()).toList(),
      'addresses': addresses?.map((x) => x.toMap()).toList(),
      'orders': orders?.map((x) => x.toMap()).toList(),
    };
  }

   factory User.empty() {
    return User(id: 'id', firstName: 'firstName', lastName: 'lastName', email: 'email', phone: 'phone', token: 'token', refreshToken: 'refreshToken', createdAt: DateTime.now(), updatedAt: DateTime.now(), addresses: [], orders: []);
  }

  factory User.fromMap(Map<String, dynamic> map) {
    List<Product> cart = [];
    List<Address> addresses = [];
    if (map["cart"] != null) {
      cart = (map["cart"] as List).map((e) => Product.fromMap(e)).toList();
    }
    if(map["address"] != null && (map["address"] as List).isNotEmpty) {
      addresses = (map["address"] as List).map((e) => Address.fromMap(e)).toList();
    }
    return User(
      id: map['_id'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      token: map['token'] as String,
      refreshToken: map['refresh_token'] as String,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      addresses: addresses,
      orders: (map["orders"] as List).map((e) => Order.fromMap(e)).toList(),
      cart: cart,

    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
