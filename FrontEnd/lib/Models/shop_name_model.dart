import 'package:json_annotation/json_annotation.dart';

part 'shop_name_model.g.dart';

@JsonSerializable()
class ShopNameModel {
  String username;
  ShopNameModel({required this.username});

  factory ShopNameModel.fromJson(Map<String, dynamic> json) =>
      _$ShopNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopNameModelToJson(this);
}
