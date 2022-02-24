import 'package:json_annotation/json_annotation.dart';
import 'package:where2buy/Models/shop_card_model.dart';
import 'package:where2buy/Models/shop_name_model.dart';

part 'search_shop_model.g.dart';

@JsonSerializable()
class SearchShopModel {
  ShopCardModel store;
  SearchShopModel({required this.store});

  factory SearchShopModel.fromJson(Map<String, dynamic> json) =>
      _$SearchShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchShopModelToJson(this);
}
