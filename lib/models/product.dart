import 'package:e_commerce_demo_flutter/models/user.dart';

class Product {
  final int id;
  final String name;
  final User seller;
  final double price;
  final String description;
  final String dateUploaded;
  final List<String> pictures;
  Product(
      {required this.id,
      required this.name,
      required this.seller,
      required this.price,
      required this.description,
      required this.dateUploaded,
      required this.pictures});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'seller': seller,
      'price': price,
      'description': description,
      'dateUploaded': dateUploaded,
      'pictures': pictures,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      seller: map['seller'],
      price: map['price'],
      description: map['description'],
      dateUploaded: map['dateUploaded'],
      pictures: map['pictures'],
    );
  }
}
