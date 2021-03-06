import 'dart:convert';
import 'package:objectid/objectid.dart';

import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: '_id')
  String id;
  String pname;
  int qty;
  int price;
  String Image;
  ProductModel({
    required this.id,
    required this.pname,
    required this.qty,
    required this.price,
    required this.Image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

List<ProductModel> fromJsonArray(String jsonString) => List<ProductModel>.from(
    json.decode(jsonString).map((item) => ProductModel.fromJson(item)));
