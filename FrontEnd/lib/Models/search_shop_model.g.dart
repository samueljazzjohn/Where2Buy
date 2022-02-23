// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchShopModel _$SearchShopModelFromJson(Map<String, dynamic> json) =>
    SearchShopModel(
      store: ShopCardModel.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchShopModelToJson(SearchShopModel instance) =>
    <String, dynamic>{
      'store': instance.store,
    };
