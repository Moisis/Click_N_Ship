import 'dart:convert';

import 'Product.dart';

class Products_list {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  Products_list({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Products_list.fromRawJson(String str) => Products_list.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products_list.fromJson(Map<String, dynamic> json) => Products_list(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}


