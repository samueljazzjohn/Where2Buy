// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCardModel _$ShopCardModelFromJson(Map<String, dynamic> json) =>
    ShopCardModel(
      shopImg: json['shopImg'] as String,
      user: ShopNameModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShopCardModelToJson(ShopCardModel instance) =>
    <String, dynamic>{
      'shopImg': instance.shopImg,
      'user': instance.user,
    };
