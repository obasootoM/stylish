import 'dart:convert';
import 'package:stylish/%20model/rating.dart';

class Product {
  final String title;
  final String description;
  final double? quantity;
  final List<String> images;
  final String category;
  final double? price;
  final String id;
  final List<Rating>? rating;
  Product(
      {required this.title,
      required this.description,
       this.quantity,
      required this.category,
       this.price,
      required this.id,
      required this.images,
      this.rating
      });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'quantity': quantity,
      'category': category,
      'price': price,
      'id': id,
      'images': images,
      'rating': rating
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      rating: map['rating'] != null ? List<Rating>.from(map['rating']?.map((x) => Rating.fromMap(x))) : null,
      title: map['title'] ?? '',
      description: map['description'] as String,
      quantity: map['quantity'].toDouble() ?? 0.0,
      category: map['category'] as String,
      price: map['price'].toDouble() ?? 0.0,
      id: map['_id'],
      images: List<String>.from(map['images'],),
      
     
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
