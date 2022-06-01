// To parse this JSON data, do
//
//     final productType = productTypeFromJson(jsonString?);

import 'dart:convert';

ProductType productTypeFromJson(String? str) =>
    ProductType.fromJson(json.decode(str!));

String? productTypeToJson(ProductType data) => json.encode(data.toJson());

class ProductType {
  ProductType({
    this.typeName,
    this.products,
  });

  final String? typeName;
  final List<Product>? products;

  factory ProductType.fromJson(Map<String?, dynamic> json) => ProductType(
        typeName: json["type_name"] == null ? null : json["type_name"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "type_name": typeName == null ? null : typeName,
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.name,
    this.rating,
    this.price,
    this.imageUrl,
  });

  String? name;
  int? rating;
  int? price;
  String? imageUrl;

  factory Product.fromJson(Map<String?, dynamic> json) => Product(
        name: json["name"] == null ? null : json["name"],
        rating: json["rating"] == null ? null : json["rating"],
        price: json["price"] == null ? null : json["price"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
      );

  Map<String?, dynamic> toJson() => {
        "\"name\"": name == null ? null : "\"$name\"",
        "\"rating\"": rating == null ? null : rating,
        "\"price\"": price == null ? null : price,
        "\"image_url\"": imageUrl == null ? null : "\"$imageUrl\"",
      };
}
