import 'package:json_annotation/json_annotation.dart';

part 'shop_image_model.g.dart';

@JsonSerializable()
class ShopImageModel {
  String shopImg;
  ShopImageModel({required this.shopImg});

  factory ShopImageModel.fromJson(Map<String, dynamic> json) =>
      _$ShopImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopImageModelToJson(this);
}
