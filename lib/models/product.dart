import 'package:e_commerce_demo_flutter/models/user.dart';

class Product {
  final int id;
  final String name;
  final User seller;
  final String color;
  final String brand;
  final List<String> pictures;
  Product(
      {required this.id,
      required this.name,
      required this.seller,
      required this.color,
      required this.brand,
      required this.pictures});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'seller': seller,
      'color': color,
      'brand': brand,
      'pictures': pictures,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      seller: map['seller'],
      color: map['color'],
      brand: map['brand'],
      pictures: map['pictures'],
    );
  }
}
