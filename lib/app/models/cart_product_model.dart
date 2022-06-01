// To parse this JSON data, do
//
//     final CartProductModel = CartProductModelFromJson(jsonString?);

import 'dart:convert';

import 'package:klik_daily/app/models/product_type_model.dart';

CartProductModel CartProductModelFromJson(String? str) =>
    CartProductModel.fromJson(json.decode(str!));

String? CartProductModelToJson(CartProductModel data) =>
    json.encode(data.toJson());

class CartProductModel {
  CartProductModel({
    this.quantity,
    this.product,
  });

  int? quantity;
  Product? product;

  factory CartProductModel.fromJson(Map<String?, dynamic> json) =>
      CartProductModel(
        quantity: json["quantity"] == null ? null : json["quantity"],
        product: json["products"] == null
            ? null
            : Product.fromJson(json["products"]),
      );

  Map<String?, dynamic> toJson() => {
        "\"quantity\"": quantity == null ? null : quantity,
        "\"products\"": product == null ? null : product?.toJson(),
      };
}

