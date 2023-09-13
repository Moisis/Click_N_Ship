import 'dart:convert';

class Cart_Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
   int quantity ;

  Cart_Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.quantity,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });




  factory Cart_Product.fromJson(Map<String, dynamic> json) => Cart_Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    stock: json["stock"],
    quantity: json["quantity"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson(Cart_Product music) => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "quantity": quantity,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
  };

  static String encode(List<Cart_Product> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => music.toJson(music))
        .toList(),
  );

  static List<Cart_Product> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Cart_Product>((item) => Cart_Product.fromJson(item))
          .toList();
}