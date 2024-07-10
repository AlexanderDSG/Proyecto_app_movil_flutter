// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Modelo de Producto en Flutter
class Product {
  String id;
  String name;
  double price;
  double stock;
  String urlImage;
  String description;
  int v;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.urlImage,
    required this.description,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"]?.toDouble() ?? 0,
        stock: json["stock"]?.toDouble() ?? 0,
        urlImage: json["urlImage"] ?? "",
        description: json["description"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "stock": stock,
        "urlImage": urlImage,
        "description": description,
      };
}



