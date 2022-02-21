// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
      username: json['username'] as String,
      shopImg: json['shopImg'] as String,
      distance: json['distance'] as String,
    );

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'username': instance.username,
      'shopImg': instance.shopImg,
      'distance': instance.distance,
    };
