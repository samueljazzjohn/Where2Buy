import 'package:json_annotation/json_annotation.dart';
import 'package:where2buy/Models/shop_image_model.dart';

part 'shop_card_model.g.dart';

@JsonSerializable()
class ShopCardModel {
  String username;
  ShopImageModel user;
  ShopCardModel({required this.username, required this.user});

  factory ShopCardModel.fromJson(Map<String, dynamic> json) =>
      _$ShopCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopCardModelToJson(this);
}
