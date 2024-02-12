import 'dart:convert';

class Product {
  final String id;
  final int price;
  final String name;
  final String category;
  final int rating;
  final String image;
  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.category,
    required this.rating,
    required this.image,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'price': price,
      'product_name': name,
      'category': category,
      'rating': rating,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] as String,
      price: map['price'] as int,
      name: map['product_name'] as String,
      category: map['category'] as String,
      rating: map['rating'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
