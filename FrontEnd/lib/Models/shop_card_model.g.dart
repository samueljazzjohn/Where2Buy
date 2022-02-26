// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCardModel _$ShopCardModelFromJson(Map<String, dynamic> json) =>
    ShopCardModel(
      shopImg: json['shopImg'] as String,
      phone: json['phone'] as String,
      place: json['place'] as String,
      user: ShopNameModel.fromJson(json['user'] as Map<String, dynamic>),
      category: json['category'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$ShopCardModelToJson(ShopCardModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'phone': instance.phone,
      'place': instance.place,
      'category': instance.category,
      'shopImg': instance.shopImg,
      'user': instance.user,
    };
