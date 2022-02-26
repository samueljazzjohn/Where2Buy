import 'package:json_annotation/json_annotation.dart';
import 'package:where2buy/Models/shop_name_model.dart';

part 'shop_card_model.g.dart';

@JsonSerializable(nullable: true)
class ShopCardModel {
  @JsonKey(name: '_id')
  String id;
  String phone;
  String place;
  String category;
  String shopImg;
  ShopNameModel user;
  ShopCardModel(
      {required this.shopImg,
      required this.phone,
      required this.place,
      required this.user,
      required this.category,
      required this.id});

  factory ShopCardModel.fromJson(Map<String, dynamic> json) =>
      _$ShopCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopCardModelToJson(this);
}
