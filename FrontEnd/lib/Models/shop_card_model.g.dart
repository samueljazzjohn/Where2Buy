// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCardModel _$ShopCardModelFromJson(Map<String, dynamic> json) =>
    ShopCardModel(
      username: json['username'] as String,
      user: ShopImageModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShopCardModelToJson(ShopCardModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'user': instance.user,
    };
