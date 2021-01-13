import 'package:flutter/foundation.dart' show required;

class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final double ratingAverage;
  bool isFavorite = false;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.ratingAverage,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Product ID'],
      name: json['Name'],
      price: json['Price'].toDouble(),
      description: json['Description'],
      ratingAverage: json['Rating Avg'].toDouble(),
    );
  }
}
