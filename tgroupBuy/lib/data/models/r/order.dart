// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'payment.dart';
import 'product.dart';

class Order {
  final String id;
  final List<Product> products;
  final int price;
  final DateTime orderedAt;
  final int? discount;
  final Payment payment;

  Order(
      {required this.id,
      required this.products,
      required this.price,
      required this.orderedAt,
      required this.discount,
      required this.payment});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'order_list': products.map((x) => x.toMap()).toList(),
      'total_price': price,
      'ordered_on': orderedAt.millisecondsSinceEpoch,
      'discount': discount,
      'payment_method': payment.toMap(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] as String,
      products:
        (map['order_list'] as List).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ).toList(),
      
      price: map['total_price'] as int,
      orderedAt: DateTime.parse(map['ordered_on'] ),
      discount: map['discount'] ?? 0,
      payment: Payment.fromMap(map['payment_method'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
